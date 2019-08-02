#!/bin/bash

export CHANNEL_NAME="mychannel"

export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_CERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
export CORE_PEER_TLS_KEY_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server,key
export CORE_PEER_TLS_ROOTCERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp

export VERSION="1.0"
export LANGUAGE="golang"
export CC_SRC_PATH="github.com/chaincode/chaincode_example02/go/"

export ORDERER_CA=/home/node1/test/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export PEER0_ORG1_CA=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export PEER0_ORG2_CA=/home/node1/test/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls


peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile $ORDERER_CA

#peer channel create -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/channel.tx --tls --cafile /home/node1/test/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem



