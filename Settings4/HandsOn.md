## 0. Raft Leader Election

```
2019-09-06 15:06:01.606 UTC [orderer.consensus.etcdraft] apply -> INFO 042 Applied config change to add node 1, current nodes in channel: [1 2 3 4 5] channel=mychannel node=2
2019-09-06 15:06:01.606 UTC [orderer.consensus.etcdraft] apply -> INFO 043 Applied config change to add node 2, current nodes in channel: [1 2 3 4 5] channel=mychannel node=2
2019-09-06 15:06:01.606 UTC [orderer.consensus.etcdraft] apply -> INFO 044 Applied config change to add node 3, current nodes in channel: [1 2 3 4 5] channel=mychannel node=2
2019-09-06 15:06:01.608 UTC [orderer.consensus.etcdraft] apply -> INFO 045 Applied config change to add node 4, current nodes in channel: [1 2 3 4 5] channel=mychannel node=2
2019-09-06 15:06:01.608 UTC [orderer.consensus.etcdraft] apply -> INFO 046 Applied config change to add node 5, current nodes in channel: [1 2 3 4 5] channel=mychannel node=2
2019-09-06 15:06:02.094 UTC [orderer.consensus.etcdraft] Step -> INFO 047 2 [logterm: 1, index: 5, vote: 0] cast MsgPreVote for 3 [logterm: 1, index: 5] at term 1 channel=mychannel node=2
2019-09-06 15:06:02.095 UTC [orderer.consensus.etcdraft] Step -> INFO 048 2 [term: 1] received a MsgVote message with higher term from 3 [term: 2] channel=mychannel node=2
2019-09-06 15:06:02.095 UTC [orderer.consensus.etcdraft] becomeFollower -> INFO 049 2 became follower at term 2 channel=mychannel node=2
2019-09-06 15:06:02.095 UTC [orderer.consensus.etcdraft] Step -> INFO 04a 2 [logterm: 1, index: 5, vote: 0] cast MsgVote for 3 [logterm: 1, index: 5] at term 2 channel=mychannel node=2
2019-09-06 15:06:02.098 UTC [orderer.consensus.etcdraft] run -> INFO 04b raft.node: 2 elected leader 3 at term 2 channel=mychannel node=2
2019-09-06 15:06:02.098 UTC [orderer.consensus.etcdraft] serveRequest -> INFO 04c Raft leader changed: 0 -> 3 channel=mychannel node=2
```

## 1. Create certificate and channel artifacts

```
$ FABRIC_CFG_PATH=$PWD
$ CHANNEL_NAME=mychannel
$ ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

$ ./bin/cryptogen generate --config=./crypto-config.yaml
org1.example.com
org2.example.com

$ mkdir channel-artifacts
$ ./bin/configtxgen -profile TwoOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
2019-09-06 13:09:15.285 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-09-06 13:09:15.365 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 002 orderer type: etcdraft
2019-09-06 13:09:15.365 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 Orderer.EtcdRaft.Options unset, setting to tick_interval:"500ms" election_tick:10 heartbeat_tick:1 max_inflight_blocks:5 snapshot_interval_size:20971520
2019-09-06 13:09:15.365 UTC [common.tools.configtxgen.localconfig] Load -> INFO 004 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 13:09:15.434 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 005 orderer type: etcdraft
2019-09-06 13:09:15.435 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 006 Orderer.EtcdRaft.Options unset, setting to tick_interval:"500ms" election_tick:10 heartbeat_tick:1 max_inflight_blocks:5 snapshot_interval_size:20971520
2019-09-06 13:09:15.435 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 007 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 13:09:15.437 UTC [common.tools.configtxgen] doOutputBlock -> INFO 008 Generating genesis block
2019-09-06 13:09:15.437 UTC [common.tools.configtxgen] doOutputBlock -> INFO 009 Writing genesis block

$ ./bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME
2019-09-06 13:11:01.937 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-09-06 13:11:02.023 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 13:11:02.092 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: etcdraft
2019-09-06 13:11:02.092 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 004 Orderer.EtcdRaft.Options unset, setting to tick_interval:"500ms" election_tick:10 heartbeat_tick:1 max_inflight_blocks:5 snapshot_interval_size:20971520
2019-09-06 13:11:02.092 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 005 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 13:11:02.092 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 006 Generating new channel configtx
2019-09-06 13:11:02.094 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 007 Writing new channel tx

$ ./bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
2019-09-06 13:11:22.863 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-09-06 13:11:22.938 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 13:11:23.013 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: etcdraft
2019-09-06 13:11:23.013 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 004 Orderer.EtcdRaft.Options unset, setting to tick_interval:"500ms" election_tick:10 heartbeat_tick:1 max_inflight_blocks:5 snapshot_interval_size:20971520
2019-09-06 13:11:23.013 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 005 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 13:11:23.013 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Generating anchor peer update
2019-09-06 13:11:23.014 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 007 Writing anchor peer update

$  ./bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP
2019-09-06 13:11:47.116 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-09-06 13:11:47.198 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 13:11:47.269 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: etcdraft
2019-09-06 13:11:47.269 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 004 Orderer.EtcdRaft.Options unset, setting to tick_interval:"500ms" election_tick:10 heartbeat_tick:1 max_inflight_blocks:5 snapshot_interval_size:20971520
2019-09-06 13:11:47.269 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 005 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 13:11:47.269 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Generating anchor peer update
2019-09-06 13:11:47.270 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 007 Writing anchor peer update
```

## 2.Start Fabric Network

```
$ docker-compose -f docker-compose-cli.yaml -f docker-compose-etcdraft2.yaml up -d

Creating network "network_byfn" with the default driver
Creating volume "network_orderer.example.com" with default driver
Creating volume "network_peer0.org1.example.com" with default driver
Creating volume "network_peer1.org1.example.com" with default driver
Creating volume "network_peer0.org2.example.com" with default driver
Creating volume "network_peer1.org2.example.com" with default driver
Creating volume "network_orderer2.example.com" with default driver
Creating volume "network_orderer3.example.com" with default driver
Creating volume "network_orderer4.example.com" with default driver
Creating volume "network_orderer5.example.com" with default driver

Creating orderer5.example.com   ... done
Creating orderer4.example.com   ... done
Creating peer0.org2.example.com ... done
Creating orderer.example.com    ... done
Creating peer1.org1.example.com ... done
Creating orderer2.example.com   ... done
Creating peer1.org2.example.com ... done
Creating orderer3.example.com   ... done
Creating peer0.org1.example.com ... done
Creating cli                    ... done

$ docker ps

docker ps
CONTAINER ID        IMAGE                               COMMAND             CREATED             STATUS              PORTS                                NAMES
9d2fa79787ed        hyperledger/fabric-tools:latest     "/bin/bash"         4 seconds ago       Up 3 seconds                                             cli
05f7b1c8d286        hyperledger/fabric-peer:latest      "peer node start"   7 seconds ago       Up 4 seconds        7051/tcp, 0.0.0.0:10051->10051/tcp   peer1.org2.example.com
d4c1a37db103        hyperledger/fabric-peer:latest      "peer node start"   7 seconds ago       Up 5 seconds        0.0.0.0:7051->7051/tcp               peer0.org1.example.com
c6ab5ef2fa5d        hyperledger/fabric-orderer:latest   "orderer"           7 seconds ago       Up 4 seconds        0.0.0.0:9050->7050/tcp               orderer3.example.com
dd1dd7be1b5d        hyperledger/fabric-orderer:latest   "orderer"           7 seconds ago       Up 4 seconds        0.0.0.0:8050->7050/tcp               orderer2.example.com
25313a72bd77        hyperledger/fabric-peer:latest      "peer node start"   7 seconds ago       Up 5 seconds        7051/tcp, 0.0.0.0:8051->8051/tcp     peer1.org1.example.com
8a8bda186a58        hyperledger/fabric-orderer:latest   "orderer"           7 seconds ago       Up 5 seconds        0.0.0.0:10050->7050/tcp              orderer4.example.com
be0a7dbb907e        hyperledger/fabric-orderer:latest   "orderer"           7 seconds ago       Up 5 seconds        0.0.0.0:7050->7050/tcp               orderer.example.com
93274f8f7d64        hyperledger/fabric-peer:latest      "peer node start"   7 seconds ago       Up 6 seconds        7051/tcp, 0.0.0.0:9051->9051/tcp     peer0.org2.example.com
327b83bbd148        hyperledger/fabric-orderer:latest   "orderer"           7 seconds ago       Up 5 seconds        0.0.0.0:11050->7050/tcp              orderer5.example.com
```

## 3. Peer Channel Configuration

#### Peer Channel Create

```
$ docker exec -it cli bash
$ export FABRIC_CFG_PATH=$PWD
$ export CHANNEL_NAME=mychannel
$ export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

$ peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile $ORDERER_CA

2019-09-06 13:15:18.418 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-09-06 13:15:18.461 UTC [cli.common] readBlock -> INFO 002 Got status: &{NOT_FOUND}
2019-09-06 13:15:18.478 UTC [channelCmd] InitCmdFactory -> INFO 003 Endorser and orderer connections initialized
2019-09-06 13:15:18.683 UTC [cli.common] readBlock -> INFO 004 Got status: &{SERVICE_UNAVAILABLE}
2019-09-06 13:15:18.686 UTC [channelCmd] InitCmdFactory -> INFO 005 Endorser and orderer connections initialized
2019-09-06 13:15:18.890 UTC [cli.common] readBlock -> INFO 006 Got status: &{SERVICE_UNAVAILABLE}
2019-09-06 13:15:18.893 UTC [channelCmd] InitCmdFactory -> INFO 007 Endorser and orderer connections initialized
2019-09-06 13:15:19.099 UTC [cli.common] readBlock -> INFO 008 Received block: 0 
```

#### Peer Join the Channel

peer0.org1

```
$ peer channel join -b mychannel.block

2019-09-06 13:16:51.696 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-09-06 13:16:51.723 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
```

peer1.org1

```
$ CORE_PEER_ADDRESS=peer1.org1.example.com:8051 \
peer channel join -b mychannel.block

2019-09-06 13:19:02.311 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-09-06 13:19:02.337 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
```

peer0.org2

```
$ CORE_PEER_ADDRESS=peer0.org2.example.com:9051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
peer channel join -b mychannel.block

2019-09-06 13:19:23.800 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-09-06 13:19:23.828 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
```

peer1.org2

```
$ CORE_PEER_ADDRESS=peer1.org2.example.com:10051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt \
peer channel join -b mychannel.block

2019-09-06 13:19:33.447 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-09-06 13:19:33.473 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
```

#### Update AnchorPeer

peer0.org1

```
$ peer channel update -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/Org1MSPanchors.tx --tls --cafile $ORDERER_CA

2019-09-06 13:21:28.553 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-09-06 13:21:28.563 UTC [channelCmd] update -> INFO 002 Successfully submitted channel update
```

peer0.org2
```
$ CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_ADDRESS=peer0.org2.example.com:9051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
peer channel update -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/Org2MSPanchors.tx --tls --cafile $ORDERER_CA

2019-09-06 13:21:36.112 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-09-06 13:21:36.125 UTC [channelCmd] update -> INFO 002 Successfully submitted channel update
```

#### Install Chaincode

peer0.org1

```
peer chaincode install -n mycc -v 1.0 -p github.com/hyperledger/fabric-samples/chaincode/chaincode_example02/go/

2019-09-06 14:38:28.157 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-09-06 14:38:28.157 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
2019-09-06 14:38:28.250 UTC [chaincodeCmd] submitInstallProposal -> INFO 003 Installed remotely: response:<status:200 payload:"OK" >
```

peer1.org1

```
CORE_PEER_ADDRESS=peer1.org1.example.com:8051 \
peer chaincode install -n mycc -v 1.0 -p github.com/hyperledger/fabric-samples/chaincode/chaincode_example02/go/

2019-09-06 14:39:01.615 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-09-06 14:39:01.615 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
2019-09-06 14:39:01.690 UTC [chaincodeCmd] submitInstallProposal -> INFO 003 Installed remotely: response:<status:200 payload:"OK" >
```

peer0.org2

```
CORE_PEER_ADDRESS=peer0.org2.example.com:9051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
peer chaincode install -n mycc -v 1.0 -p github.com/hyperledger/fabric-samples/chaincode/chaincode_example02/go/

2019-09-06 14:39:35.047 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-09-06 14:39:35.047 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
2019-09-06 14:39:35.127 UTC [chaincodeCmd] submitInstallProposal -> INFO 003 Installed remotely: response:<status:200 payload:"OK" >
```

peer1.org2

```
CORE_PEER_ADDRESS=peer1.org2.example.com:10051 \
CORE_PEER_LOCALMSPID="Org2MSP" \
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp \
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt \
peer chaincode install -n mycc -v 1.0 -p github.com/hyperledger/fabric-samples/chaincode/chaincode_example02/go/

2019-09-06 14:39:41.618 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-09-06 14:39:41.618 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
2019-09-06 14:39:41.708 UTC [chaincodeCmd] submitInstallProposal -> INFO 003 Installed remotely: response:<status:200 payload:"OK" >
```

#### Instantiate Chaincode
```
$ peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":["init","a","100","b","200"]}' -P "OR ('Org1MSP.peer','Org2MSP.peer')"

2019-08-14 02:50:37.102 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-08-14 02:50:37.102 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
```

#### Query chaincode

```
$ peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'
100

$ peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","b"]}'
200
```

#### Invoke chaincode

```
$ peer chaincode invoke -o orderer.example.com:7050  --tls --cafile $ORDERER_CA  -C $CHANNEL_NAME -n mycc -c '{"Args":["invoke","a","b","10"]}'
2019-08-14 04:49:53.752 UTC [chaincodeCmd] chaincodeInvokeOrQuery -> INFO 001 Chaincode invoke successful. result: status:200
```

#### Query chaincode

```
$ peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'
90

$ peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","b"]}'
210
```

