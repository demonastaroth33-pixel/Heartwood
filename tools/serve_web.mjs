import http from 'node:http';
import { gzipSync } from 'node:zlib';
import { readFile } from 'node:fs/promises';
import { extname, join, normalize, resolve } from 'node:path';

const root = resolve(process.argv[2] ?? 'build/web');
const port = Number(process.argv[3] ?? 8080);
const types = {
  '.html': 'text/html',
  '.js': 'text/javascript',
  '.mjs': 'text/javascript',
  '.wasm': 'application/wasm',
  '.json': 'application/json',
  '.webmanifest': 'application/manifest+json',
  '.png': 'image/png',
  '.ico': 'image/x-icon',
  '.css': 'text/css',
  '.svg': 'image/svg+xml',
  '.txt': 'text/plain',
};

// Cross-origin isolation (T0): unlocks SharedArrayBuffer for this origin,
// which lets the Drift WASM storage use its fast worker path instead of the
// sharedIndexedDb fallback, and makes multi-threaded skwasm eligible later.
// Safe here: the app loads nothing cross-origin (fonts bundled, no remote
// media or fonts) -- so `require-corp` cannot break any asset.
const ISOLATION_HEADERS = {
  'Cross-Origin-Opener-Policy': 'same-origin',
  'Cross-Origin-Embedder-Policy': 'require-corp',
};

// gzip only text-ish assets worth compressing; skip already-binary formats
// (png, ico) and anything under 1KB where the header overhead is a loss.
const compressible = new Set([
  '.html', '.js', '.json', '.css', '.svg', '.txt', '.webmanifest', '.wasm',
]);

http
  .createServer(async (req, res) => {
    try {
      const urlPath = decodeURIComponent(new URL(req.url ?? '/', 'http://x').pathname);
      let file = normalize(join(root, urlPath));
      if (!file.startsWith(normalize(root))) {
        res.writeHead(403).end();
        return;
      }
      let data;
      try {
        data = await readFile(file);
      } catch {
        file = join(root, 'index.html');
        data = await readFile(file);
      }
      const ext = extname(file);
      const mime = ext ? (types[ext] ?? 'application/octet-stream') : 'text/html';
      const gz = compressible.has(ext) && data.length > 1024 ? gzipSync(data) : null;
      const headers = {
        'Content-Type': mime,
        ...ISOLATION_HEADERS,
        'Vary': 'Accept-Encoding',
        ...(gz
          ? { 'Content-Encoding': 'gzip', 'Content-Length': gz.length }
          : { 'Content-Length': data.length }),
      };
      res.writeHead(200, headers);
      res.end(gz ?? data);
    } catch {
      res.writeHead(404).end();
    }
  })
  .listen(port, () => console.log(`serving ${root} on :${port}`));