#!/bin/bash

export GOPATH=/usr/lib/go/
export VERSION="1.0"
export LANGUAGE="golang"
export CC_SRC_PATH="github.com/chaincode/chaincode_example02/go/"
export FABRIC_CFG_PATH=${PWD}

# Install Chaincode peer0.org1.example

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_MSPCONFIGPATH=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_TLS_ROOTCERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_TLS_KEY_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.key
export CORE_PEER_TLS_CERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051

peer chaincode install -n mycc -v ${VERSION} -l ${LANGUAGE} -p ${CC_SRC_PATH}

# Install Chaincode peer1.org1.example

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_MSPCONFIGPATH=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_TLS_ROOTCERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt
export CORE_PEER_TLS_KEY_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.key
export CORE_PEER_TLS_CERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.crt
export CORE_PEER_ADDRESS=peer1.org1.example.com:8051

peer chaincode install -n mycc -v ${VERSION} -l ${LANGUAGE} -p ${CC_SRC_PATH}
