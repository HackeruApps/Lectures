const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

function handler(req, res){
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hello World\n');
}

//init server object
const server = http.createServer(handler);

server.listen(port, hostname);