
export CHANNEL_NAME=mychannel

sudo rm -rf crypto-config
sudo mkdir crypto-config

sudo rm -rf channel-artifacts
sudo mkdir channel-artifacts

./bin/cryptogen generate --config=./crypto-config.yaml


echo
echo ============================================
echo Create Generate Block
echo ============================================
echo


./bin/configtxgen -profile SampleDevModeKafka -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block

echo
echo ============================================
echo Create Channel.tx
echo ============================================
echo

./bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME


echo
echo ============================================
echo Anchor Peer Update
echo ============================================
echo

./bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP