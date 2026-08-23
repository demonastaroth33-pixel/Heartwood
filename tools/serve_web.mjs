import http from 'node:http';
import { readFile } from 'node:fs/promises';
import { extname, join, normalize, resolve } from 'node:path';

const root = resolve(process.argv[2] ?? 'build/web');
const port = Number(process.argv[3] ?? 8080);
const types = {
  '.html': 'text/html',
  '.js': 'text/javascript',
  '.wasm': 'application/wasm',
  '.json': 'application/json',
  '.webmanifest': 'application/manifest+json',
  '.png': 'image/png',
  '.ico': 'image/x-icon',
  '.css': 'text/css',
  '.svg': 'image/svg+xml',
  '.txt': 'text/plain',
};

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
      res.writeHead(200, { 'Content-Type': mime });
      res.end(data);
    } catch {
      res.writeHead(404).end();
    }
  })
  .listen(port, () => console.log(`serving ${root} on :${port}`));