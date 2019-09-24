
export CHANNEL_NAME=mychannel

sudo rm -rf crypto-config
sudo mkdir crypto-config

./bin/cryptogen generate --config=./crypto-config.yaml


echo
echo ============================================
echo Anchor Peer Update
echo ============================================
echo

./bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP