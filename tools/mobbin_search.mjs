#!/usr/bin/env node
// Mobbin screen/flow search bypass harness + skill router backend.
// The mobbin-mcp CLI (v1.0.19) 404s because its app-list endpoint
// (/api/searchable-apps/{platform}) was retired. The live paths are:
//   POST /api/search-bar/search                       -> app IDs by query
//   GET  /apps/<slug>-<platform>-<appId>              -> app page; embeds version link
//   GET  /apps/<slug>-<platform>-<appId>/<v>/screens  -> RSC stream: screens + flows
// Usage (CLI): node tools/mobbin_search.mjs "<query>" <Pattern1,Pattern2> <kw1,kw2> [limit] [platform]
// Example:     node tools/mobbin_search.mjs "habit tracker" Dashboard,Progress - 8 ios
// The .opencode/skills/mobbin-search/scripts/mobbin-search.mjs router imports
// searchScreens/searchFlows/quickSearchApps from this module.
import { readFileSync, writeFileSync } from "node:fs";
import { homedir } from "node:os";
import { join } from "node:path";
import { resolve } from "node:path";
import { pathToFileURL } from "node:url";

const authFile = join(homedir(), ".mobbin-mcp", "auth.json");
const authSession = JSON.parse(readFileSync(authFile, "utf8"));

const base =
  process.env.MOBBIN_MCP_DIST ||
  join(homedir(), "AppData/Roaming/npm/node_modules/@aos-engineer/mobbin-mcp/dist/");
const { MobbinApiClient } = await import(pathToFileURL(join(base, "services/api-client.js")));
const { MobbinAuth } = await import(pathToFileURL(join(base, "services/auth.js")));

const auth = MobbinAuth.fromSession(authSession);
const client = new MobbinApiClient(auth);
const MOBBIN = "https://mobbin.com";

async function cookie() {
  return auth.getCookieValue();
}

function decodeNextRscStream(html) {
  const marker = "self.__next_f.push([1,";
  let out = "";
  let from = 0;
  while (true) {
    const start = html.indexOf(marker, from);
    if (start === -1) break;
    let i = start + marker.length;
    while (i < html.length && html[i] !== '"') i += 1;
    if (html[i] !== '"') {
      from = start + marker.length;
      continue;
    }
    const literalStart = i;
    i += 1;
    let esc = false;
    for (; i < html.length; i += 1) {
      const c = html[i];
      if (esc) {
        esc = false;
        continue;
      }
      if (c === "\\") {
        esc = true;
        continue;
      }
      if (c === '"') break;
    }
    const literal = html.slice(literalStart, i + 1);
    try {
      out += JSON.parse(literal);
    } catch {
      /* skip malformed chunk */
    }
    from = i + 1;
  }
  return out;
}

function extractBalancedArray(stream, openIdx) {
  let depth = 0;
  let inStr = false;
  let esc = false;
  for (let j = openIdx; j < stream.length; j += 1) {
    const c = stream[j];
    if (inStr) {
      if (esc) esc = false;
      else if (c === "\\") esc = true;
      else if (c === '"') inStr = false;
      continue;
    }
    if (c === '"') inStr = true;
    else if (c === "[") depth += 1;
    else if (c === "]") {
      depth -= 1;
      if (depth === 0) return stream.slice(openIdx, j + 1);
    }
  }
  return null;
}

function extractRscArray(stream, marker) {
  const keyIdx = stream.indexOf(marker);
  if (keyIdx === -1) return null;
  const openIdx = stream.indexOf("[", keyIdx);
  if (openIdx === -1) return null;
  const arr = extractBalancedArray(stream, openIdx);
  if (!arr) return null;
  try {
    return JSON.parse(arr.replace(/"\$undefined"/g, "null"));
  } catch {
    return null;
  }
}

function parseAppRscContent(html) {
  const stream = decodeNextRscStream(html);
  const flows = extractRscArray(stream, '"partialFlows":') ?? [];
  const screens = extractRscArray(stream, '"screens":[{"type":"') ?? [];
  return { flows, screens };
}

function anyTagMatches(have, wanted) {
  if (!have || have.length === 0) return false;
  const lowered = have.map((t) => String(t).toLowerCase());
  return wanted.some((want) => {
    const lw = String(want).toLowerCase();
    return lowered.some((tag) => tag === lw || tag.includes(lw));
  });
}

function ocrText(screen) {
  return (screen.ocrBoundingBoxes ?? [])
    .map((b) => b.text ?? "")
    .join(" ")
    .replace(/\s+/g, " ")
    .trim();
}

function screenMatches(screen, { patterns = [], elements = [], keywords = [] }) {
  if (patterns.length && !anyTagMatches(screen.screenPatterns, patterns)) return false;
  if (elements.length && !anyTagMatches(screen.screenElements, elements)) return false;
  if (keywords.length) {
    const ocr = ocrText(screen).toLowerCase();
    if (!keywords.some((k) => ocr.includes(k.toLowerCase()))) return false;
  }
  return true;
}

function slugify(name) {
  return (
    (name || "app")
      .toLowerCase()
      .normalize("NFKD")
      .replace(/[\u0300-\u036f]/g, "")
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-+|-+$/g, "") || "app"
  );
}

async function fetchAppContent(appId, platform, nameHint) {
  const slug = slugify(nameHint);
  const ck = await cookie();
  const appRes = await fetch(`${MOBBIN}/apps/${slug}-${platform}-${appId}`, {
    headers: { Cookie: ck },
  });
  if (!appRes.ok) throw new Error(`app page ${appRes.status}`);
  const appHtml = await appRes.text();
  const link = appHtml.match(/\/apps\/[A-Za-z0-9-]+\/([0-9a-f-]{36})\/(?:screens|flows)/);
  const versionId = link?.[1];
  if (!versionId) throw new Error(`no version link for ${appId}`);
  const title = appHtml.match(/<meta property="og:title" content="([^"]+)"/)?.[1] ?? "";
  const appName = title.replace(/\s*(?:iOS|Android|Web)\s*\|.*$/, "").trim();
  const res = await fetch(`${MOBBIN}/apps/${slug}-${platform}-${appId}/${versionId}/screens`, {
    headers: { Cookie: ck },
  });
  if (!res.ok) throw new Error(`screens page ${res.status}`);
  const parsed = parseAppRscContent(await res.text());
  return { ...parsed, appName };
}

async function searchAppsViaBar(query, platform, limit) {
  const res = await client.request("/api/search-bar/search", {
    method: "POST",
    body: { query, experience: "apps", platform },
  });
  const v = res?.value ?? {};
  const ids = [...(v.primary ?? []), ...(v.other ?? [])].map((x) => x.id);
  return [...new Set(ids)].slice(0, limit);
}

export async function searchScreens({ query, patterns = [], elements = [], keywords = [], platform = "ios", limitApps = 10 }) {
  const ids = await searchAppsViaBar(query, platform, limitApps);
  const out = [];
  for (const id of ids) {
    let parsed;
    try {
      parsed = await fetchAppContent(id, platform, query);
    } catch {
      continue;
    }
    for (const s of parsed.screens ?? []) {
      if (!screenMatches(s, { patterns, elements, keywords })) continue;
      out.push({
        id: s.id ?? "",
        appId: s.appId ?? id,
        appName: s.appName ?? parsed.appName ?? query,
        platform,
        screenPatterns: s.screenPatterns ?? [],
        screenElements: s.screenElements ?? [],
        screenKeywords: ocrText(s),
        screenUrl: s.screenUrl ?? "",
        metadata: s.width && s.height ? { width: s.width, height: s.height } : null,
      });
    }
  }
  return out;
}

export async function searchFlows({ query, flowActions = [], platform = "ios", limitApps = 10 }) {
  const ids = await searchAppsViaBar(query, platform, limitApps);
  const out = [];
  for (const id of ids) {
    let parsed;
    try {
      parsed = await fetchAppContent(id, platform, query);
    } catch {
      continue;
    }
    const screensById = new Map((parsed.screens ?? []).map((s) => [s.id, s]));
    const appName = parsed.appName || (parsed.screens?.[0]?.appName) || query;
    for (const f of parsed.flows ?? []) {
      if (flowActions.length && !anyTagMatches(f.actions, flowActions)) continue;
      out.push({
        id: f.id ?? "",
        appId: id,
        appName,
        platform,
        name: f.name ?? "",
        actions: f.actions ?? [],
        order: f.order ?? 0,
        screens: (f.screens ?? [])
          .slice()
          .sort((a, b) => (a.order ?? 0) - (b.order ?? 0))
          .map((ref) => ({
            id: ref.screenId ?? "",
            screenUrl: screensById.get(ref.screenId)?.screenUrl ?? "",
          })),
      });
    }
  }
  return out;
}

export async function quickSearchApps({ query, platform = "ios", limit = 10 }) {
  const ids = await searchAppsViaBar(query, platform, limit);
  const out = [];
  for (const id of ids) {
    try {
      const ck = await cookie();
      const res = await fetch(`${MOBBIN}/apps/${slugify(query)}-${platform}-${id}`, {
        headers: { Cookie: ck },
      });
      const html = await res.text();
      const title = html.match(/<meta property="og:title" content="([^"]+)"/)?.[1] ?? "";
      const name = title.replace(/\s*(?:iOS|Android|Web)\s*\|.*$/, "").trim();
      out.push({ id, platform, appName: name || query });
    } catch {
      continue;
    }
  }
  return out;
}

const isMain =
  process.argv[1] && import.meta.url === pathToFileURL(resolve(process.argv[1])).href;
if (isMain) {
  const rawArgs = process.argv.slice(2);
  const query = rawArgs[0] ?? "";
  const patterns = (rawArgs[1] ?? "").split(",").filter(Boolean);
  const keywords = (rawArgs[2] ?? "")
    .split(",")
    .map((k) => k.trim())
    .filter((k) => k.length > 0 && k !== "-");
  const limit = Number(rawArgs[3]) || 8;
  const platform = rawArgs[4] || "ios";
  const results = await searchScreens({ query, patterns, keywords, platform, limitApps: limit });
  console.log(
    `query='${query}' platform=${platform} patterns=[${patterns}] keywords=[${keywords}] apps=${limit} hits=${results.length}`
  );
  results.slice(0, 24).forEach((r, i) => {
    console.log(`\n[${i + 1}] ${r.appName}`);
    console.log(`  pattern: ${r.screenPatterns.join(", ")}`);
    console.log(`  elements: ${r.screenElements.join(", ")}`);
    if (r.screenKeywords) console.log(`  ocr: ${r.screenKeywords.slice(0, 200)}`);
    console.log(`  url: ${r.screenUrl}`);
  });
  if (results.length) {
    const outFile = rawArgs[5] || "tools/mobbin_findings.json";
    writeFileSync(outFile, JSON.stringify(results, null, 2));
    console.log(`\nwrote ${outFile} (${results.length})`);
  }
}