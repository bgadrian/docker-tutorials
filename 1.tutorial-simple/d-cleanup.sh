#!/usr/bin/env bash

#stop and remove all containers
docker stop tut-memcache
docker rm tut-memcache

docker stop tut-app
docker rm tut-app

#remove the network
docker network rm tut-network