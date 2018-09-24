#!/usr/bin/env bash
#make sure the app is stopped
docker stop tut-app
docker rm tut-app

docker build `#make an image and save it on local docker installation` \
    -t tut-app-image:v1 `#tag it with this name:tag` \
    -t tut-app-image:latest  `#make it the latest version too` \
    . `#build with the instructions found on ./Dockerfile`

#run the app locally, from the previous built image
docker run `#main command, run a container on my machine` \
    --name tut-app `#put it an unique name so you can access it later` \
    --detach `#detach the process from the current bash` \
    --network tut-network `#connect it to the private network we created, --link is deprecated` \
    --restart=on-failure:3 `#if the app.js crashes, docker will restart the container 3 times max` \
    --publish 0.0.0.0:80:80 `#link EXPOSEd port from Docker file to your localhost` \
    tut-app-image:latest `#the name of the image:tag`

#more options https://docs.docker.com/engine/reference/commandline/run/#description
echo "You can visit http://localhost/ or type 'curl localhost'"
docker ps `#list all the running containers`
