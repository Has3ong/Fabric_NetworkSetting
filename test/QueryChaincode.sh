#!/bin/bash

export GOPATH=/usr/lib/go
export VERSION="1.0"
export LANGUAGE="golang"

export ORDERER_CA=/home/node1/test/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export PEER0_ORG1_CA=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export PEER0_ORG2_CA=/home/node1/test/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls

# Instantiating chaincode peer0.org1

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_MSPCONFIGPATH=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_TLS_ROOTCERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_TLS_KEY_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.key
export CORE_PEER_TLS_CERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051

#peer chaincode instantiate -o orderer.example.com:7050 -C mychannel -n mycc -l ${LANGUAGE} -v ${VERSION} -c '{"Args":["init","a","100","b","200"]}' -P "OR ('Org1MSP.peer','Org2MSP.peer')" --tls --cafile $ORDERER_CA


# Querying chaincode peer1.org1

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_MSPCONFIGPATH=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_TLS_ROOTCERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt
export CORE_PEER_TLS_KEY_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.key
export CORE_PEER_TLS_CERT_FILE=/home/node1/test/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.crt
export CORE_PEER_ADDRESS=peer1.org1.example.com:8051

peer chaincode query -C mychannel -n mycc -c '{"Args":["query","a"]}'
