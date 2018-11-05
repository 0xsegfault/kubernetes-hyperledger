FROM nginx

RUN apt update -y
RUN apt install emacs curl -y

WORKDIR /app

RUN curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/configtx.yaml > /app/configtx.yaml
RUN curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/crypto-config.yaml > /app/crypto-config.yaml
RUN curl -sSL http://bit.ly/2ysbOFE | bash -s 1.3.0

RUN ./bin/cryptogen generate --config crypto-config.yaml