## 1. Node1 Setting

Initalize node1 node2 host file
```
$ sudo vi /etc/hosts
192.168.56.2	orderer.example.com
192.168.56.2	peer0.org1.example.com
192.168.56.2	peer1.org1.example.com
192.168.56.3	peer0.org2.example.com
192.168.56.3	peer1.org2.example.com
```

Install Sample

```
$ cd ~/
$ git clone https://github.com/Has3ong/Fabric_NetworkSetting.git

$ cp -r ~/Fabric_NetworkSetting/Settings1/node1/test .

$ cd ~/test
$ chmod +x Setting.sh CreateChannel.sh ChannelJoin.sh InstallChaincode.sh QueryChaincode.sh
$ curl https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh | bash -s -- 1.4.0 1.4.0 -d -s
$ cp ./bin/cryptogen ./bin/configtxgen ./bin/orderer ./bin/peer ./bin/configtxlator .
```

## 2. Fabric Network Start

```
$ ./Setting.sh

org1.example.com
org2.example.com
====================================================================
======================Create Crypto Config End======================
====================================================================
2019-08-02 22:16:49.606 KST [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-08-02 22:16:49.660 KST [common.tools.configtxgen.localconfig] completeInitialization -> INFO 002 orderer type: solo
2019-08-02 22:16:49.660 KST [common.tools.configtxgen.localconfig] Load -> INFO 003 Loaded configuration: /home/node1/test/configtx.yaml
2019-08-02 22:16:49.714 KST [common.tools.configtxgen.localconfig] completeInitialization -> INFO 004 orderer type: solo
2019-08-02 22:16:49.714 KST [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 005 Loaded configuration: /home/node1/test/configtx.yaml
2019-08-02 22:16:49.717 KST [common.tools.configtxgen] doOutputBlock -> INFO 006 Generating genesis block
2019-08-02 22:16:49.718 KST [common.tools.configtxgen] doOutputBlock -> INFO 007 Writing genesis block
====================================================================
===================== Create Genesis Block =====================
====================================================================
2019-08-02 22:16:51.751 KST [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-08-02 22:16:51.803 KST [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/node1/test/configtx.yaml
2019-08-02 22:16:51.858 KST [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
2019-08-02 22:16:51.858 KST [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /home/node1/test/configtx.yaml
2019-08-02 22:16:51.859 KST [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 005 Generating new channel configtx
2019-08-02 22:16:51.863 KST [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 006 Writing new channel tx
2019-08-02 22:16:51.889 KST [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-08-02 22:16:51.944 KST [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/node1/test/configtx.yaml
2019-08-02 22:16:51.996 KST [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
2019-08-02 22:16:51.996 KST [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /home/node1/test/configtx.yaml
2019-08-02 22:16:51.996 KST [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
2019-08-02 22:16:51.997 KST [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update
2019-08-02 22:16:52.021 KST [common.tools.configtxgen] main -> INFO 001 Loading configuration
2019-08-02 22:16:52.073 KST [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /home/node1/test/configtx.yaml
2019-08-02 22:16:52.126 KST [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
2019-08-02 22:16:52.126 KST [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /home/node1/test/configtx.yaml
2019-08-02 22:16:52.126 KST [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
2019-08-02 22:16:52.127 KST [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update
====================================================================
================Create Channel.tx Update Anchor Peer================
====================================================================
sed: docker-compose-e2e.yaml (을)를 읽을 수 없음: 그런 파일이나 디렉터리가 없습니다
0f52f8eb27ff1957e7b8bc6d8d0364e4b093b538280d9c4ca3acc88180fcb01f_sk
sed: docker-compose-e2e.yaml (을)를 읽을 수 없음: 그런 파일이나 디렉터리가 없습니다
rm: 'docker-compose-e2e.yamlt'를 지울 수 없음: 그런 파일이나 디렉터리가 없습니다
76f0d4d5b448be8442217479cc5f9137a3da2574952bbbbc27ca1669e8436f7d_sk
====================================================================
===================ReplaceKey End, Network Start====================
====================================================================
Creating network "fabric_byfn" with the default driver
Creating volume "fabric_orderer.example.com" with default driver
Creating volume "fabric_peer0.org1.example.com" with default driver
Creating volume "fabric_peer1.org1.example.com" with default driver
Pulling orderer.example.com (hyperledger/fabric-orderer:1.4.0)...
1.4.0: Pulling from hyperledger/fabric-orderer
3b37166ec614: Already exists
504facff238f: Already exists
ebbcacd28e10: Already exists
c7fb3351ecad: Already exists
2e3debadcbf7: Already exists
fc435e46e32e: Already exists
a4922bafdce8: Already exists
7d9964965066: Already exists
1aa1f5822ea4: Pull complete
f3adcb95411e: Pull complete
Pulling peer0.org1.example.com (hyperledger/fabric-peer:1.4.0)...
1.4.0: Pulling from hyperledger/fabric-peer
3b37166ec614: Already exists
504facff238f: Already exists
ebbcacd28e10: Already exists
c7fb3351ecad: Already exists
2e3debadcbf7: Already exists
fc435e46e32e: Already exists
a4922bafdce8: Already exists
7d9964965066: Already exists
625153a09c48: Already exists
291344806a10: Already exists
Pulling peer1.org1.example.com (hyperledger/fabric-peer:1.4.0)...
1.4.0: Pulling from hyperledger/fabric-peer
Creating orderer.example.com    ... done
Creating peer1.org1.example.com ... done
Creating peer0.org1.example.com ... done
```

## Create Channel

```
$ ./CreateChannel.sh

2019-08-02 22:17:57.682 KST [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-08-02 22:17:57.712 KST [cli.common] readBlock -> INFO 002 Received block: 0
```

## Peer join the channel, Updating anhcor peers

```
$ ./ChannelJoin.sh

2019-08-02 22:18:07.680 KST [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-08-02 22:18:07.711 KST [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
2019-08-02 22:18:07.754 KST [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-08-02 22:18:07.779 KST [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
2019-08-02 22:18:07.820 KST [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-08-02 22:18:07.831 KST [channelCmd] update -> INFO 002 Successfully submitted channel update
```

## Install chaincode

```
$ ./InstallChaincode.sh

2019-08-02 22:18:10.167 KST [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-08-02 22:18:10.168 KST [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
2019-08-02 22:18:10.217 KST [chaincodeCmd] install -> INFO 003 Installed remotely response:<status:200 payload:"OK" > 
2019-08-02 22:18:10.260 KST [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-08-02 22:18:10.260 KST [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
2019-08-02 22:18:10.301 KST [chaincodeCmd] install -> INFO 003 Installed remotely response:<status:200 payload:"OK" >
```

## Instantiating chaincode, Querying chaincode
```
$ ./QueryChaincode.sh

2019-08-02 22:18:14.909 KST [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-08-02 22:18:14.910 KST [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc

100
```

## Docker Container Check

```
$ docker ps

docker ps
CONTAINER ID        IMAGE                                                                                                  COMMAND                  CREATED             STATUS              PORTS                    NAMES
ecdfc5401bc3        dev-peer1.org1.example.com-mycc-1.0-cd123150154e6bf2df7ce682e0b1bcbea40499416f37a6da3aae14c4eb51b08d   "chaincode -peer.add…"   3 hours ago         Up 3 hours                                   dev-peer1.org1.example.com-mycc-1.0
4896983eec71        dev-peer0.org1.example.com-mycc-1.0-384f11f484b9302df90b453200cfb25174305fce8f53f4e94d45ee3b6cab0ce9   "chaincode -peer.add…"   3 hours ago         Up 3 hours                                   dev-peer0.org1.example.com-mycc-1.0
93994a6c8de5        hyperledger/fabric-peer:1.4.0                                                                          "peer node start"        3 hours ago         Up 3 hours          0.0.0.0:7051->7051/tcp   peer0.org1.example.com
b1fe07f93505        hyperledger/fabric-peer:1.4.0                                                                          "peer node start"        3 hours ago         Up 3 hours          0.0.0.0:8051->8051/tcp   peer1.org1.example.com
e58e481589eb        hyperledger/fabric-orderer:1.4.0                                                                       "orderer"                3 hours ago         Up 3 hours          0.0.0.0:7050->7050/tcp   orderer.example.com
```