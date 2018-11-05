FROM nginx

RUN apt update -y
RUN apt install emacs curl git -y

WORKDIR /app

RUN curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/configtx.yaml > /app/configtx.yaml
RUN curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/crypto-config.yaml > /app/crypto-config.yaml
RUN curl -sSL http://bit.ly/2ysbOFE | bash -s 1.3.0

RUN mkdir /app/orderer
RUN mkdir /app/channels

RUN ./fabric-samples/bin/cryptogen generate --config crypto-config.yaml
RUN ./fabric-samples/bin/configtxgen -profile OrdererGenesis -outputBlock ./orderer/orderer.genesis.block

RUN ./fabric-samples/bin/configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg1anchor.tx -channelID mainchannel -asOrg Org1MSP
RUN ./fabric-samples/bin/configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg2anchor.tx -channelID mainchannel -asOrg Org2MSP
RUN ./fabric-samples/bin/configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg3anchor.tx -channelID mainchannel -asOrg Org3MSP