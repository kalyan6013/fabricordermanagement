./bin/cryptogen generate --config=crypto-config.yaml

./bin/configtxgen -profile OrdererManagementGenesis -channelID mychannel -outputBlock ./channel-artifacts/genesis.block

./bin/configtxgen -profile BS_Channel -outputCreateChannelTx ./channel-artifacts/BS_Channel.tx -channelID bschannel

./bin/configtxgen -profile BS_Channel -outputAnchorPeersUpdate ./channel-artifacts/BuyerMSPBS_Channelanchors.tx -channelID bschannel -asOrg BuyerMSP

./bin/configtxgen -profile BS_Channel -outputAnchorPeersUpdate ./channel-artifacts/sellerMSPBS_Channelanchors.tx -channelID bschannel -asOrg SellerMSP

# docker-compose -f docker-compose-cli.yaml up -d

# docker ps
