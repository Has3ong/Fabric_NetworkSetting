## Install Certificate

```
$ cd ~/fabric-samples/first-network/
$ ../bin/cryptogen generate --config=./crypto-config.yaml

org1.example.com
org2.example.com
```

Before
```
vagrant@node1:~/fabric-samples/first-network$ ls
base                  connection-org3.json              docker-compose-etcdraft2.yaml
byfn.sh               connection-org3.yaml              docker-compose-kafka.yaml
channel-artifacts     crypto-config.yaml                docker-compose-org3.yaml
configtx.yaml         docker-compose-ca.yaml            eyfn.sh
connection-org1.json  docker-compose-cli.yaml           org3-artifacts
connection-org1.yaml  docker-compose-couch-org3.yaml    README.md
connection-org2.json  docker-compose-couch.yaml         scripts
connection-org2.yaml  docker-compose-e2e-template.yaml
```

After
```
vagrant@node1:~/fabric-samples/first-network$ ls
base                  connection-org3.json            docker-compose-e2e-template.yaml
byfn.sh               connection-org3.yaml            docker-compose-etcdraft2.yaml
channel-artifacts     crypto-config                   docker-compose-kafka.yaml
configtx.yaml         crypto-config.yaml              docker-compose-org3.yaml
connection-org1.json  docker-compose-ca.yaml          eyfn.sh
connection-org1.yaml  docker-compose-cli.yaml         org3-artifacts
connection-org2.json  docker-compose-couch-org3.yaml  README.md
connection-org2.yaml  docker-compose-couch.yaml       scripts
```

## Install Genesis Block
```
$ cd ~/fabric-samples/first-network/
$ export FABRIC_CFG_PATH=$PWD

$ ../bin/configtxgen -profile TwoOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
2019-08-31 05:22:13.474 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-08-31 05:22:13.526 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 002 orderer type: solo
2019-08-31 05:22:13.526 UTC [common.tools.configtxgen.localconfig] Load -> INFO 003 Loaded configuration: /home/vagrant/fabric-samples/first-network/configtx.yaml
2019-08-31 05:22:13.576 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 004 orderer type: solo
2019-08-31 05:22:13.577 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 005 Loaded configuration: /home/vagrant/fabric-samples/first-network/configtx.yaml
2019-08-31 05:22:13.578 UTC [common.tools.configtxgen] doOutputBlock -> INFO 006 Generating genesis block
2019-08-31 05:22:13.579 UTC [common.tools.configtxgen] doOutputBlock -> INFO 007 Writing genesis block
```

## Install Channel Transaction

```
$ export CHANNEL_NAME=mychannel  && ../bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME
2019-08-31 05:23:30.542 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-08-31 05:23:30.601 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/vagrant/fabric-samples/first-network/configtx.yaml
2019-08-31 05:23:30.650 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
2019-08-31 05:23:30.650 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /home/vagrant/fabric-samples/first-network/configtx.yaml
2019-08-31 05:23:30.651 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 005 Generating new channel configtx
2019-08-31 05:23:30.653 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 006 Writing new channel tx
```

## Anchor Peer
```
$ ../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

2019-08-31 05:25:06.495 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-08-31 05:25:06.556 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/vagrant/fabric-samples/first-network/configtx.yaml
2019-08-31 05:25:06.605 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
2019-08-31 05:25:06.605 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /home/vagrant/fabric-samples/first-network/configtx.yaml
2019-08-31 05:25:06.606 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
2019-08-31 05:25:06.606 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update

$ ../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP

2019-08-31 05:25:13.378 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-08-31 05:25:13.438 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/vagrant/fabric-samples/first-network/configtx.yaml
2019-08-31 05:25:13.487 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
2019-08-31 05:25:13.488 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /home/vagrant/fabric-samples/first-network/configtx.yaml
2019-08-31 05:25:13.488 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
2019-08-31 05:25:13.488 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update

$ ls -al channel-artifacts/

total 36
drwxr-xr-x 2 vagrant vagrant  4096 Aug 31 05:25 .
drwxr-xr-x 7 vagrant vagrant  4096 Aug 31 05:24 ..
-rw-r--r-- 1 vagrant vagrant   348 Aug 31 05:23 channel.tx
-rw-r--r-- 1 vagrant vagrant 12957 Aug 31 05:22 genesis.block
-rw-r--r-- 1 vagrant vagrant     0 Aug 31 05:13 .gitkeep
-rw-r--r-- 1 vagrant vagrant   284 Aug 31 05:25 Org1MSPanchors.tx
-rw-r--r-- 1 vagrant vagrant   284 Aug 31 05:25 Org2MSPanchors.tx
```

## Start Nework

```
$ cd ~/fabric-samples/first-network/
$ ./byfn.sh up

Starting for channel 'mychannel' with CLI timeout of '10' seconds and CLI delay of '3' seconds
Continue? [Y/n] y
proceeding ...
LOCAL_VERSION=1.4.2
DOCKER_IMAGE_VERSION=1.4.2
Creating network "net_byfn" with the default driver
Creating volume "net_orderer.example.com" with default driver
Creating volume "net_peer0.org1.example.com" with default driver
Creating volume "net_peer1.org1.example.com" with default driver
Creating volume "net_peer0.org2.example.com" with default driver
Creating volume "net_peer1.org2.example.com" with default driver
Creating peer0.org1.example.com ... done
Creating peer1.org2.example.com ... done
Creating orderer.example.com    ... done
Creating peer1.org1.example.com ... done
Creating peer0.org2.example.com ... done
Creating cli                    ... done
CONTAINER ID        IMAGE                               COMMAND             CREATED             STATUS                  PORTS                      NAMES
619a27b6c80f        hyperledger/fabric-tools:latest     "/bin/bash"         1 second ago        Up Less than a second                              cli
625c5e8670d4        hyperledger/fabric-peer:latest      "peer node start"   4 seconds ago       Up 1 second             0.0.0.0:8051->8051/tcp     peer1.org1.example.com
f7600186144a        hyperledger/fabric-peer:latest      "peer node start"   4 seconds ago       Up 1 second             0.0.0.0:9051->9051/tcp     peer0.org2.example.com
5c91614bd6d3        hyperledger/fabric-orderer:latest   "orderer"           4 seconds ago       Up Less than a second   0.0.0.0:7050->7050/tcp     orderer.example.com
56a1be256c83        hyperledger/fabric-peer:latest      "peer node start"   4 seconds ago       Up 1 second             0.0.0.0:10051->10051/tcp   peer1.org2.example.com
ced6ad80813d        hyperledger/fabric-peer:latest      "peer node start"   4 seconds ago       Up 2 seconds            0.0.0.0:7051->7051/tcp     peer0.org1.example.com

 ____    _____      _      ____    _____
/ ___|  |_   _|    / \    |  _ \  |_   _|
\___ \    | |     / _ \   | |_) |   | |
 ___) |   | |    / ___ \  |  _ <    | |
|____/    |_|   /_/   \_\ |_| \_\   |_|

Build your first network (BYFN) end-to-end test

Channel name : mychannel
+ peer channel create -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/channel.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

......

========= All GOOD, BYFN execution completed ===========


 _____   _   _   ____
| ____| | \ | | |  _ \
|  _|   |  \| | | | | |
| |___  | |\  | | |_| |
|_____| |_| \_| |____/

```

## Docker Container 
```
$ docker container exec -it cli bash
```

## Channel Settings

```
$ export CHANNEL_NAME=mychannel
$ export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
$ peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile $ORDERER_CA
2019-08-14 01:58:47.422 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-08-14 01:58:47.470 UTC [cli.common] readBlock -> INFO 002 Received block: 0

$ ls -al
total 36
drwxr-xr-x 5 root root  4096 Aug 14 01:58 .
drwxr-xr-x 3 root root  4096 Aug 14 01:51 ..
drwxr-xr-x 2 1000 1000  4096 Aug 14 01:47 channel-artifacts
drwxr-xr-x 4 1000 1000  4096 Aug 14 00:57 crypto
-rw-r--r-- 1 root root 15968 Aug 14 01:58 mychannel.block
drwxr-xr-x 2 1000 1000  4096 Aug 14 00:32 scripts
```

## Peer Channel Join
```
$ peer channel join -b mychannel.block

$ CORE_PEER_ADDRESS=peer1.org1.example.com:8051 \
peer channel join -b mychannel.block

$ CORE_PEER_ADDRESS=peer0.org2.example.com:9051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
peer channel join -b mychannel.block

$ CORE_PEER_ADDRESS=peer1.org2.example.com:10051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt \
peer channel join -b mychannel.block

$ docker container exec -it peer0.org1.example.com bash

$ peer channel list

2019-08-31 05:33:22.418 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
Channels peers has joined:
mychannel
```

## Anchor Peer Update
```
$ peer channel update -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/Org1MSPanchors.tx --tls --cafile $ORDERER_CA

$ CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_ADDRESS=peer0.org2.example.com:9051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
peer channel update -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/Org2MSPanchors.tx --tls --cafile $ORDERER_CA
```

## Chaincode Install
```
$ peer chaincode install -n mycc -v 1.0 -p github.com/chaincode/chaincode_example02/go/

$ CORE_PEER_ADDRESS=peer1.org1.example.com:8051 \
peer chaincode install -n mycc -v 1.0 -p github.com/chaincode/chaincode_example02/go/

$ CORE_PEER_ADDRESS=peer0.org2.example.com:9051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
peer chaincode install -n mycc -v 1.0 -p github.com/chaincode/chaincode_example02/go/

$ CORE_PEER_ADDRESS=peer1.org2.example.com:10051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt \
peer chaincode install -n mycc -v 1.0 -p github.com/chaincode/chaincode_example02/go/

```

## Chaincode Instantiate
```
$ peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":["init","a","100","b","200"]}' -P "OR ('Org1MSP.peer','Org2MSP.peer')"
2019-08-31 05:37:39.332 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-08-31 05:37:39.335 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc

$ peer chaincode list --instantiated -C $CHANNEL_NAME
Get instantiated chaincodes on channel mychannel:
Name: mycc, Version: 1.0, Path: github.com/chaincode/chaincode_example02/go/, Escc: escc, Vscc: vscc
```

## Chaincode Query

```
$ peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'
100

$ peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","b"]}'
200
```

## Chaincode Invoke
```
$ peer chaincode invoke -o orderer.example.com:7050  --tls --cafile $ORDERER_CA  -C $CHANNEL_NAME -n mycc -c '{"Args":["invoke","a","b","10"]}'
2019-08-31 05:38:24.476 UTC [chaincodeCmd] chaincodeInvokeOrQuery -> INFO 001 Chaincode invoke successful. result: status:200
```

## Chaincode Query Result
```
$ peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'
90

$ peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","b"]}'
210
```

## Shut down Network
```
$ ./byfn.sh down
Stopping for channel 'mychannel' with CLI timeout of '10' seconds and CLI delay of '3' seconds
Continue? [Y/n] y
proceeding ...
WARNING: The BYFN_CA1_PRIVATE_KEY variable is not set. Defaulting to a blank string.
WARNING: The BYFN_CA2_PRIVATE_KEY variable is not set. Defaulting to a blank string.
Stopping cli                    ... done
Stopping peer1.org1.example.com ... done
Stopping peer0.org2.example.com ... done
Stopping orderer.example.com    ... done
Stopping peer1.org2.example.com ... done
Stopping peer0.org1.example.com ... done
Removing cli                    ... done
Removing peer1.org1.example.com ... done
Removing peer0.org2.example.com ... done
Removing orderer.example.com    ... done
Removing peer1.org2.example.com ... done
Removing peer0.org1.example.com ... done
Removing network net_byfn
Removing volume net_orderer.example.com
Removing volume net_peer0.org1.example.com
Removing volume net_peer1.org1.example.com
Removing volume net_peer0.org2.example.com
Removing volume net_peer1.org2.example.com
```