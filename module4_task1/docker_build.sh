#!/bin/bash

# docker build - < docker/Dockerfile
#docker tag $(docker images --format "{{.ID}}" | head -1) awesome:build
docker run -id awesome:build
docker cp . $(docker ps -q):/go/test_dir
docker attach $(docker ps --format "{{.Names}}")
docker exec -id $(docker ps -q) sh -c "ls /go/test_dir"
