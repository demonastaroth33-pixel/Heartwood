#!/usr/bin/env node
// Mobbin search router.
// Search actions (search-screens / search-flows / quick-search) route through
// the repo's bypass harness (tools/mobbin_search.mjs) because the mobbin-mcp
// CLI 404s on its retired app-list endpoint. All other actions delegate to the
// CLI as before. Payload schema matches the CLI's `skill` command.
import { spawnSync } from "node:child_process";
import { existsSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const [action, payload = "{}"] = process.argv.slice(2);
if (!action || action === "--help" || action === "-h") {
  console.log("Usage: node scripts/mobbin-search.mjs <action> '<json-payload>'");
  process.exit(0);
}

const BYPASS_ACTIONS = new Set(["search-screens", "search-flows", "quick-search"]);

function parsePayload() {
  try {
    const parsed = JSON.parse(payload);
    if (!parsed || typeof parsed !== "object" || Array.isArray(parsed)) {
      throw new Error("The skill command payload must be a JSON object.");
    }
    return parsed;
  } catch (e) {
    console.error(`Invalid JSON payload: ${e.message}`);
    process.exit(2);
  }
}

function str(v) {
  return typeof v === "string" && v.trim() ? v : undefined;
}

function strArray(v) {
  if (!Array.isArray(v)) return [];
  return v.filter((item) => typeof item === "string" && item.trim().length > 0);
}

function num(v, fallback) {
  return typeof v === "number" && Number.isFinite(v) ? v : fallback;
}

function platform(v) {
  return v === "android" || v === "web" ? v : "ios";
}

function truncate(text, max = 12000) {
  return text.length > max ? text.slice(0, max) + "\n…(truncated)" : text;
}

async function runBypass() {
  const here = dirname(fileURLToPath(import.meta.url));
  const harness = resolve(here, "../../../../tools/mobbin_search.mjs");
  if (!existsSync(harness)) {
    console.error(`bypass harness not found at ${harness}`);
    process.exit(3);
  }
  const mod = await import(pathToFileURL(harness));
  const p = parsePayload();

  if (action === "search-screens") {
    const query =
      str(p.query) ??
      strArray(p.screen_keywords)[0] ??
      strArray(p.screen_patterns)[0] ??
      "mobile app";
    const results = await mod.searchScreens({
      query,
      patterns: strArray(p.screen_patterns),
      elements: strArray(p.screen_elements),
      keywords: strArray(p.screen_keywords),
      platform: platform(p.platform),
      limitApps: num(p.page_size, 10),
    });
    if (results.length === 0) {
      console.log("No screens found.");
      return;
    }
    const lines = results.map((s, i) => [
      `### ${i + 1}. ${s.appName} — ${s.screenPatterns.join(", ") || "Screen"}`,
      `- **App**: ${s.appName}`,
      `- **Platform**: ${s.platform}`,
      `- **Patterns**: ${s.screenPatterns.join(", ") || "None"}`,
      `- **Elements**: ${s.screenElements.join(", ") || "None"}`,
      `- **Screen URL**: ${s.screenUrl}`,
      `- **App ID**: ${s.appId}`,
      `- **Screen ID**: ${s.id}`,
      s.metadata ? `- **Dimensions**: ${s.metadata.width}x${s.metadata.height}` : "",
    ]
      .filter(Boolean)
      .join("\n"));
    console.log(truncate(lines.join("\n\n")));
    return;
  }

  if (action === "search-flows") {
    const query =
      str(p.query) ?? strArray(p.flow_actions)[0] ?? "mobile app";
    const results = await mod.searchFlows({
      query,
      flowActions: strArray(p.flow_actions),
      platform: platform(p.platform),
      limitApps: num(p.page_size, 10),
    });
    if (results.length === 0) {
      console.log("No flows found.");
      return;
    }
    const lines = results.map((f, i) => [
      `### ${i + 1}. ${f.appName} — ${f.name || "Flow"}`,
      `- **App**: ${f.appName}`,
      `- **Actions**: ${f.actions.join(", ") || "None"}`,
      `- **Steps**: ${f.screens.length}`,
      f.screens
        .slice(0, 5)
        .map((s, j) => `  ${j + 1}. ${s.screenUrl}`)
        .join("\n"),
    ]
      .filter(Boolean)
      .join("\n"));
    console.log(truncate(lines.join("\n\n")));
    return;
  }

  if (action === "quick-search") {
    const results = await mod.quickSearchApps({
      query: str(p.query) ?? "",
      platform: platform(p.platform),
      limit: num(p.page_size, 10),
    });
    if (results.length === 0) {
      console.log("No apps found.");
      return;
    }
    console.log(
      results
        .map((a, i) => `${i + 1}. **${a.appName}**\n- ID: ${a.id}\n- Platform: ${a.platform}`)
        .join("\n\n")
    );
    return;
  }
}

if (BYPASS_ACTIONS.has(action)) {
  await runBypass();
  process.exit(0);
}

const here = dirname(fileURLToPath(import.meta.url));
const localBins = [];
let cursor = here;
for (let depth = 0; depth < 10; depth += 1) {
  localBins.push(resolve(cursor, "index.js"));
  cursor = resolve(cursor, "..");
}
const localBin = localBins.find((candidate) => existsSync(candidate));
const bin = process.env.MOBBIN_MCP_BIN || (localBin ? process.execPath : "npx");
const args = process.env.MOBBIN_MCP_BIN
  ? ["skill", action, payload]
  : localBin
    ? [localBin, "skill", action, payload]
    : ["-y", "@aos-engineer/mobbin-mcp", "skill", action, payload];

const result = spawnSync(bin, args, { stdio: "inherit", shell: false });
process.exit(result.status ?? 1);