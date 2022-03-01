#!/bin/bash

docker run -t -d golang:1.15.8-buster /bin/bash
DOCKER_ID=$(docker ps | tail -1 | cut -d " " -f 1)
docker cp . $DOCKER_ID:/go/test_dir
docker exec $DOCKER_ID sh -c "rm /go/test_dir/github-workflow.yml"
docker exec $DOCKER_ID sh -c "cd /go/test_dir && go build"
docker cp $DOCKER_ID:/go/test_dir/awesome-api .
