#!/bin/bash

# Peer Join peer0.org1.example
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_MSPCONFIGPATH=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_TLS_ROOTCERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_TLS_KEY_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.key
export CORE_PEER_TLS_CERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051

peer channel join -b /home/node1/test/mychannel.block

# Peer Join peer1.org1.example
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_MSPCONFIGPATH=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_TLS_ROOTCERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt
export CORE_PEER_TLS_KEY_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.key
export CORE_PEER_TLS_CERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.crt
export CORE_PEER_ADDRESS=peer1.org1.example.com:8051

peer channel join -b /home/node1/test/mychannel.block

# Updating anchor peer
export CHANNEL_NAME="mychannel"
export ORDERER_CA=/home/node1/test/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

peer channel update -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/Org1MSPanchors.tx --tls --cafile $ORDERER_CA
