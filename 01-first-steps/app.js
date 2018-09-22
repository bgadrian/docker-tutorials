//after you update this file do not forget to run `./d-run-app.sh`

const memjs = require("./memjs/memjs")
const cache = memjs.Client.create("tut-memcache");
const http = require('http');

const handleRequest = function (request, response) {
  //to see the log messages from a container use `docker logs -f tut-app`
  console.log("request received");

  cache
    //note, this command will increase the value by 1, for ANY request
    //if you access it from a browser it will make 2 requests: "/" and "favicon.ico"
    .increment("pageviews", 1, { initial: 0, expires: 0 })
    .then(() => {
      return cache.get("pageviews");
    })
    .then((val) => {
      //responding to the http request
      response.writeHead(200);
      response.end("Hello from app.js! Request count: " + val.value + "\n");
    })
    .catch(reason => {
      console.error(reason);
      response.writeHead(500);
      response.end("Error: " + reason);
    })
}

const www = http.createServer(handleRequest);
//the same port must be in the Dockerfile
//by default docker will not expose any port, for security reasons
console.log("I am listening on :8080");
www.listen(8080);
