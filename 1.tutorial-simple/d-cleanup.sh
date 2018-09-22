#!/usr/bin/env bash

#stop and remove all containers
docker stop tut-memcache
docker rm tut-memcache

docker stop tut-app
docker rm tut-app

#remove the images
docker rmi memcached:1.5.10-alpine
docker rmi tut-app-image
docker images -qf dangling=true | xargs docker rmi

#remove the network
docker network rm tut-network