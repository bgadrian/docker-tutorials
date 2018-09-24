
## About

This repository should be a self-sufficient tutorial for a back-end developer to get started with Docker.

It was built as a companion code for the first part of my Pragmatic Docker intro series:
https://coder.today/docker-01-first-steps-of-your-web-app-pragmatic-intro-series-ee281a3b440d

## Requirements

* a Unix like environment (MacOS, Linux or **Bash** on Windows)
* basic knowledge about Linux, Docker and bash/CLI
* installed **docker** at least version 15–18 or latest
* internet access (so docker can download the images)
* you can [run docker commands with your user](https://medium.com/r/?url=https%3A%2F%2Faskubuntu.com%2Fquestions%2F477551%2Fhow-can-i-use-docker-without-sudo) (**without sudo**)
* basic knowledge on how to build **back-end web services**

## Learn

By reading the article, the suggested resources and the source files from this repository you should get a sense of what Docker is and how can we use it.

You will see the benefits of containers and images right away, with one command you will have any known database or application running on any computer, without polluting your system with its dependencies.

## Do the do

1. Clone this repo and change your working directory to `cd ./1.tutorial-simple`
2. Run these commands in order

```bash
./d-create-network.sh
./d-run-memcache.sh
./d-run-app.sh
```

3. You should have the app and memcache up and running
```bash
$ curl localhost
Hello from app.js! Page views: 0
$ curl localhost
Hello from app.js! Page views: 1
$ curl localhost
Hello from app.js! Page views: 2
```


