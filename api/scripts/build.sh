#!/bin/bash

echo "Building project"
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o bin/api main.go
