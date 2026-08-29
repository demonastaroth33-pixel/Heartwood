// Mobbin research helper — calls the harness exports directly (avoids PS quoting).
// Usage: node research-journaling/mobbin-query.mjs <action> <query> [platform] [limit]
// action: screens | flows | apps
import { searchScreens, searchFlows, quickSearchApps } from "../tools/mobbin_search.mjs";

const [action, query, platform = "ios", limit = "8"] = process.argv.slice(2);
const lim = parseInt(limit, 10);

if (action === "screens") {
  const r = await searchScreens({ query, platform, limitApps: lim });
  console.log(JSON.stringify({ action, query, platform, count: r.length, results: r }, null, 1));
} else if (action === "flows") {
  const r = await searchFlows({ query, platform, limitApps: lim });
  console.log(JSON.stringify({ action, query, platform, count: r.length, results: r }, null, 1));
} else if (action === "apps") {
  const r = await quickSearchApps({ query, platform, limit: lim });
  console.log(JSON.stringify({ action, query, platform, count: r.length, results: r }, null, 1));
} else {
  console.error("unknown action: " + action);
  process.exit(2);
}