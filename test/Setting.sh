#!/bin/bash

export IMAGE_TAG=1.4.0
export COMPOSE_PROJECT_NAME="fabric"
# Create Crypto-Config, org1.example.com, org2.example.com

export FABRIC_CFG_PATH=$PWD
rm -Rf crypto-config
cryptogen generate --config=./crypto-config.yaml

echo ====================================================================
echo ======================Create Crypto Config End======================
echo ====================================================================

sleep 2

# Create Genesis Block

# solo
configtxgen -profile TwoOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block

# raft
# configtxgen -profile SampleMultiNodeEtcdRaft -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
# kafka
# configtxgen -profile SampleDevModeKafka -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block

echo ====================================================================
echo =====================   Create Genesis Block   =====================
echo ====================================================================

sleep 2

# Create Channel.tx
export CHANNEL_NAME=mychannel

configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

# Update AnchorPeer

configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP

sleep 2

echo ====================================================================
echo ================Create Channel.tx Update Anchor Peer================
echo ====================================================================


# ReplaceKey
export PATH=${PWD}/../bin:${PWD}:$PATH
export FABRIC_CFG_PATH=${PWD}
export VERBOSE=false
export CURRENT_DIR=$PWD
OPTS="-it"

cd crypto-config/peerOrganizations/org1.example.com/ca/
PRIV_KEY=$(ls *_sk)
cd "$CURRENT_DIR"
sed $OPTS "s/CA1_PRIVATE_KEY/${PRIV_KEY}/g" docker-compose-e2e.yaml

echo ${PRIV_KEY}

cd crypto-config/peerOrganizations/org2.example.com/ca/
PRIV_KEY=$(ls *_sk)
cd "$CURRENT_DIR"
sed $OPTS "s/CA2_PRIVATE_KEY/${PRIV_KEY}/g" docker-compose-e2e.yaml
rm docker-compose-e2e.yamlt

echo ${PRIV_KEY}

echo ====================================================================
echo ===================ReplaceKey End, Network Start====================
echo ====================================================================

# Start the Network
docker-compose -f docker-compose-cli.yaml up -d
