#!/usr/bin/env bash

docker stop tut-memcache
docker rm tut-memcache

docker run `#main command, run a container on my machine` \
    --name tut-memcache `#put it an unique name so you can access it later` \
    --detach `#detach the process from the current bash` \
    --network tut-network `#connect it to the private network we created, --link is deprecated` \
    --restart=on-failure:3 `#if the memcached process crashes, docker will restart the container 3 times max` \
    memcached:1.5.10-alpine `#the name of the image, see https://hub.docker.com/_/memcached/, alpine is small`

 #more options https://docs.docker.com/engine/reference/commandline/run/#description

 docker ps `#list all the running containers`
