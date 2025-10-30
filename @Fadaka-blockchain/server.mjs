// server.mjs
import { createServer } from 'node:http';

const server = createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello World!\n');
});

// starts a simple http server locally on port 3000
server.listen(3001, '127.0.0.1', () => {
  console.log('Listening on 102.89.40.15:8888');
});

// run with `node server.mjs`
