Manager
================

1. /app/bin/cryptogen generate --config /app/crypto-config.yaml
2. configtxgen -profile SEGFAULTOrdererGenesis -outputBlock ./orderer/genesis.block
3. configtxgen -profile MainChannel -outputCreateChannelTx ./channels/Main.tx -channelID mainchannel
4. configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg1anchor.tx -channelID mainchannel -asOrg Org1MSP
5. configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg2anchor.tx -channelID mainchannel -asOrg Org2MSP
6. configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channels/mainchannelorg3anchor.tx -channelID mainchannel -asOrg Org3MSP
