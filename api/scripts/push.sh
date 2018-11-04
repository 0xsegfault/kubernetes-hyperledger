#!/bin/bash

# Get version
TAG=$(git rev-parse HEAD)

# Login to docker
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Build the project
./scripts/build.sh
docker build -t 0xsegfault/api:latest -t 0xsegfault/api:$TAG .

# Push the project to docker hub
docker push 0xsegfault/api:latest
docker push 0xsegfault/api:$TAG
