#!/bin/sh

. ./env.sh

CHANNEL_NAME="mychannel"
CORE_PEER_LOCALMSPID="Org1MSP"
VERSION="1.0"
LANGUAGE="golang"
CC_SRC_PATH="github.com/chaincode/chaincode_example02/go/"

setGlobals 0 1
set -x
set +x
peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f ${CHANNEL_NAME}.tx

setGlobals 0 1
set -x
peer channel join -b ./${CHANNEL_NAME}.block
set +x

setGlobals 1 1
set -x
peer channel join -b ./${CHANNEL_NAME}.block
set +x

setGlobals 0 1
set -x
peer channel update -o orderer.example.com:7050 -c $CHANNEL_NAME - f ./${CORE_PEER_LOCALMSPID}anchors.tx
set +x

setGlobals 0 1
set -x
peer chaincode install -n mycc -v ${VERSION} -l ${LANGUAGE} -p ${CC_SRC_PATH}
set +x
sleep 3

setGlobals 1 1
set -x
peer chaincode install -n mycc -v ${VERSION} -l ${LANGUAGE} -p ${CC_SRC_PATH}
set +x
sleep 3

setGlobals 0 1
set -x
Instantiate - peer chaincode instantiate -o orderer.example.com:7050 -C $CHANNEL_NAME -n mycc -l ${LANGUAGE} -v ${VERSION} -c '{"Args":["init","a","100","b","200"]}' -P "OR ('Org1MSP.peer','Org2MSP.peer')"
set +x
sleep 3

setGlobals 1 1
set -x
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'
set +x