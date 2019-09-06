## Node1

### 1. Create certificate and channel artifacts

```
$ FABRIC_CFG_PATH=$PWD
$ CHANNEL_ID = "mychannel"

$ ./bin/cryptogen generate --config=./crypto-config.yaml
org1.example.com
org2.example.com

$ ./bin/configtxgen -profile TwoOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
20 19-09-06 18:10:13.578 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-09-06 18:10:13.633 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 002 orderer type: solo
2019-09-06 18:10:13.633 UTC [common.tools.configtxgen.localconfig] Load -> INFO 003 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 18:10:13.679 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 004 orderer type: solo
2019-09-06 18:10:13.679 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 005 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 18:10:13.680 UTC [common.tools.configtxgen] doOutputBlock -> INFO 006 Generating genesis block
2019-09-06 18:10:13.681 UTC [common.tools.configtxgen] doOutputBlock -> INFO 007 Writing genesis block

$ ./bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/${CHANNEL_ID}.tx -channelID $CHANNEL_ID
2019-09-06 18:13:02.634 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-09-06 18:13:02.682 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 18:13:02.730 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
2019-09-06 18:13:02.730 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 18:13:02.730 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 005 Generating new channel configtx
2019-09-06 18:13:02.731 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 006 Writing new channel tx

$ ./bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_ID -asOrg Org1MSP
2019-09-06 18:13:29.732 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-09-06 18:13:29.785 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 18:13:29.833 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
2019-09-06 18:13:29.833 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 18:13:29.833 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
2019-09-06 18:13:29.834 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update
``` 

### 2. Start Fabric Network
```
$ chmod +x Start.sh

./Start.sh

Creating peer0.org1.example.com ... done
Creating peer1.org1.example.com ... done
Creating orderer.example.com    ... done
Creating cli                    ... done

$ docker ps
CONTAINER ID        IMAGE                              COMMAND             CREATED             STATUS              PORTS                    NAMES
7001757462c2        hyperledger/fabric-tools:1.4.0     "/bin/bash"         3 seconds ago       Up 2 seconds                                 cli
c79b7b8b0031        hyperledger/fabric-orderer:1.4.0   "orderer"           4 seconds ago       Up 3 seconds        0.0.0.0:7050->7050/tcp   orderer.example.com
53d8888fd5bc        hyperledger/fabric-peer:1.4.0      "peer node start"   4 seconds ago       Up 3 seconds        0.0.0.0:7051->7051/tcp   peer0.org1.example.com
d347462b0dfa        hyperledger/fabric-peer:1.4.0      "peer node start"   4 seconds ago       Up 3 seconds        0.0.0.0:8051->8051/tcp   peer1.org1.example.com
```

### 3. Create Channel, Install Chaincode

```
$ chmod +x env.sh Initalize.sh
$ docker exec -it cli bash

root@2c6135cf3093:/opt/gopath/src/github.com/hyperledger/fabric/peer# cd channel-artifacts/
root@2c6135cf3093:/opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts# ./Initalize.sh

$ docker ps
CONTAINER ID        IMAGE                                                                                                  COMMAND                  CREATED             STATUS              PORTS                    NAMES
bbcd66343206        dev-peer1.org1.example.com-mycc-1.0-cd123150154e6bf2df7ce682e0b1bcbea40499416f37a6da3aae14c4eb51b08d   "chaincode -peer.add…"   26 seconds ago      Up 25 seconds                                dev-peer1.org1.example.com-mycc-1.0
454c39052b8a        dev-peer0.org1.example.com-mycc-1.0-384f11f484b9302df90b453200cfb25174305fce8f53f4e94d45ee3b6cab0ce9   "chaincode -peer.add…"   48 seconds ago      Up 47 seconds                                dev-peer0.org1.example.com-mycc-1.0
7001757462c2        hyperledger/fabric-tools:1.4.0                                                                         "/bin/bash"              5 minutes ago       Up 5 minutes                                 cli
c79b7b8b0031        hyperledger/fabric-peer:1.4.0                                                                          "peer node start"        5 minutes ago       Up 5 minutes        0.0.0.0:7051->7051/tcp   peer0.org1.example.com
53d8888fd5bc        hyperledger/fabric-orderer:1.4.0                                                                       "orderer"                5 minutes ago       Up 5 minutes        0.0.0.0:7050->7050/tcp   orderer.example.com
d347462b0dfa        hyperledger/fabric-peer:1.4.0    
```

## Node2

### 1. Create certificate and channel artifacts

```
$ ./bin/cryptogen generate --config=./crypto-config.yaml
$ CHANNEL_ID = "mychannel"

org1.example.com
org2.example.com

$ ./bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_ID -asOrg Org2MSP
2019-09-06 18:13:29.732 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-09-06 18:13:29.785 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 18:13:29.833 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
2019-09-06 18:13:29.833 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /home/vagrant/Network/configtx.yaml
2019-09-06 18:13:29.833 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
2019-09-06 18:13:29.834 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update
```

### 2. Start Fabric Network
```
$ chmod +x Start.sh

./Start.sh

Creating peer0.org2.example.com ... done
Creating peer1.org2.example.com ... done
Creating cli                    ... done
```

### 3. Create Channel, Install Chaincode

```
$ chmod +x env.sh Initalize.sh
$ docker exec -it cli bash

root@2c6135cf3093:/opt/gopath/src/github.com/hyperledger/fabric/peer# cd channel-artifacts/
root@2c6135cf3093:/opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts# ./Initalize.sh

```

## Invoke, Query

Invoke

```
peer chaincode invoke -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -C $CHANNEL_NAME -n mycc -c '{"Args":["invoke","a","b","10"]}’
```

Query
```
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'
```