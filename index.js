const http = require('http');
const port = process.env.PORT || 8088;

const requestHandler = (request, response) => {
  response.end('Eduardo Vilas Boas - DSM 2024');
};

const server = http.createServer(requestHandler);

server.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
