#!/bin/bash

docker build -t 0xsegfault/api -f Dockerfile.dev .
docker run -p 8000:8000 0xsegfault/api
