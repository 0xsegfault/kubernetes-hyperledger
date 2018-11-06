#!/bin/bash

apt update -y
apt install curl -y

curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/configtx.yaml > /app/configtx.yaml
curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/crypto-config.yaml > /app/crypto-config.yaml
curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/bin/cryptogen > /app/cryptogen
curl https://raw.githubusercontent.com/0xsegfault/kubernetes-hyperledger/master/bin/configtxgen > /app/configtxgen

chmod +x /app/cryptogen
chmod +x /app/configtxgen

mkdir -p /app/orderer
mkdir -p /app/channels
mkdir -p /storage

./cryptogen generate --config crypto-config.yaml
./configtxgen -profile OrdererGenesis -outputBlock ./orderer/orderer.genesis.block

./configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg1anchor.tx -channelID mainchannel -asOrg Org1MSP
./configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg2anchor.tx -channelID mainchannel -asOrg Org2MSP
./configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg3anchor.tx -channelID mainchannel -asOrg Org3MSP

cp ./orderer/orderer.genesis.block crypto-config/ordererOrganizations/segfault.com/orderers/orderer0.segfault.com
cp ./orderer/orderer.genesis.block crypto-config/ordererOrganizations/segfault.com/orderers/orderer1.segfault.com
cp ./orderer/orderer.genesis.block crypto-config/ordererOrganizations/segfault.com/orderers/orderer2.segfault.com

cp -R crypto-config/ordererOrganizations/segfault.com/orderers/orderer.segfault.com /storage
cp -R crypto-config/ordererOrganizations/segfault.com/orderers/orderer0.segfault.com /storage
cp -R crypto-config/ordererOrganizations/segfault.com/orderers/orderer1.segfault.com /storage
cp -R crypto-config/ordererOrganizations/segfault.com/orderers/orderer2.segfault.com /storage
