docker build -t 0xsegfault/client:latest -f ./client/Dockerfile ./client
docker build -t 0xsegfault/manager:latest -f ./manager/Dockerfile ./manager
docker build -t 0xsegfault/api:latest -f ./api/Dockerfile ./api

docker build -t 0xsegfault/client:$SHA -f ./client/Dockerfile ./client
docker build -t 0xsegfault/manager:$SHA -f ./manager/Dockerfile ./manager
docker build -t 0xsegfault/api:$SHA -f ./api/Dockerfile ./api

docker push 0xsegfault/client:latest
docker push 0xsegfault/manager:latest
docker push 0xsegfault/api:latest

docker push 0xsegfault/client:$SHA
docker push 0xsegfault/manager:$SHA
docker push 0xsegfault/api:$SHA