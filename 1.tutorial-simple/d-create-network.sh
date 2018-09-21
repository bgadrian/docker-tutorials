#!/usr/bin/env bash

docker network create tut-network `#last param is the name`

docker network ls `#list all the networks, to confirm it was created`