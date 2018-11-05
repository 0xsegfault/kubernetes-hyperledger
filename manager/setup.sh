#!/bin/bash

curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/configtx.yaml > /app/configtx.yaml
curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/crypto-config.yaml > /app/crypto-config.yaml
curl -sSL http://bit.ly/2ysbOFE | bash -s 1.3.0

mkdir /app/orderer
mkdir /app/channels

./fabric-samples/bin/cryptogen generate --config crypto-config.yaml
./fabric-samples/bin/configtxgen -profile OrdererGenesis -outputBlock ./orderer/orderer.genesis.block

./fabric-samples/bin/configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg1anchor.tx -channelID mainchannel -asOrg Org1MSP
./fabric-samples/bin/configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg2anchor.tx -channelID mainchannel -asOrg Org2MSP
./fabric-samples/bin/configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg3anchor.tx -channelID mainchannel -asOrg Org3MSP