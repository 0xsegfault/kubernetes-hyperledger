docker build -t 0xsegfault/client:latest -t 0xsegfault/client:$SHA -f ./client/Dockerfile ./client
docker build -t 0xsegfault/manager:latest -t 0xsegfault/manager:$SHA -f ./manager/Dockerfile ./manager

docker push 0xsegfault/client:latest
docker push 0xsegfault/manager:latest

docker push 0xsegfault/client:$SHA
docker push 0xsegfault/manager:$SHA