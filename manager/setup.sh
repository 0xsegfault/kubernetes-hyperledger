#!/bin/bash

apt update -y
apt install emacs curl git -y

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

cp ./orderer/orderer.genesis.block crypto-config/ordererOrganizations/segfault.com/orderers/orderer0.segfault.com
cp ./orderer/orderer.genesis.block crypto-config/ordererOrganizations/segfault.com/orderers/orderer1.segfault.com
cp ./orderer/orderer.genesis.block crypto-config/ordererOrganizations/segfault.com/orderers/orderer2.segfault.com

# mkdir -p /storage/orderer1
# mkdir -p /storage/orderer2
# mkdir -p /storage/orderer3

# cp -R crypto-config/ordererOrganizations/segfault.com/orderers/orderer0.segfault.com /storage/orderer1
# cp -R crypto-config/ordererOrganizations/segfault.com/orderers/orderer1.segfault.com /storage/orderer2
# cp -R crypto-config/ordererOrganizations/segfault.com/orderers/orderer2.segfault.com /storage/orderer3