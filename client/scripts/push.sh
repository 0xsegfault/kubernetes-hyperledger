#!/bin/bash

# Get version
TAG=$(git rev-parse HEAD)

# Login to docker
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Build the project
docker build -t 0xsegfault/client:latest -t 0xsegfault/client:$TAG .

# Push the project to docker hub
docker push 0xsegfault/client:latest
docker push 0xsegfault/client:$TAG
