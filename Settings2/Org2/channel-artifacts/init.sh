#!/bin/sh

. ./env.sh

CHANNEL_NAME="mychannel"
CORE_PEER_LOCALMSPID="Org2MSP"
VERSION="1.0"
LANGUAGE="golang"
CC_SRC_PATH="github.com/chaincode/chaincode_example02/go/"

setGlobals 0 2
set -x
peer channel fetch 0 ${CHANNEL_NAME}.block -o orderer0.example.com:7050 -c $CHANNEL_NAME
set +x

echo "Having all peers for org2 join the channel..."
setGlobals 0 2
set -x
peer channel join -b ./${CHANNEL_NAME}.block
set +x

setGlobals 1 2
set -x
peer channel join -b ./${CHANNEL_NAME}.block
set +x

echo "Updating anchor peers for org2..."
setGlobals 0 2
set -x
peer channel update -o orderer0.example.com:7050 -c $CHANNEL_NAME - f ./${CORE_PEER_LOCALMSPID}anchors.tx
set +x

echo "Installing chaincode on peer0.org2..."
setGlobals 0 2
set -x
peer chaincode install -n mycc -v ${VERSION} -l ${LANGUAGE} -p ${CC_SRC_PATH}
set +x
sleep 3

echo "Installing chaincode on peer1.org2..."
setGlobals 1 2
set -x
peer chaincode install -n mycc -v ${VERSION} -l ${LANGUAGE} -p ${CC_SRC_PATH}
set +x
sleep 3


echo "Querying chaincode on peer0.org2..."
setGlobals 0 2
set -x
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'
set +x
sleep 3

echo "Querying chaincode on peer1.org2..."
setGlobals 1 2
set -x
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'
set +x
