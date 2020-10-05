const http = require("http");
const getRandomName = require("./randomName");

const server = http.createServer(function (request, response) {
  response.writeHead(200, { "Content-Type": "text/plain" });
  response.end(`Hello World ${getRandomName()}!`);
});

const port = 8080;
server.listen(port);

console.log("Server running at http://localhost:%d", port);

module.exports= { getRandomName };
