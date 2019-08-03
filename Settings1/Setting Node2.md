## 1. Node2 Setting

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

$ cp -r ~/Fabric_NetworkSetting/Settings1/node2/test .

$ cd ~/test
$ chmod +x Setting.sh CreateChannel.sh ChannelJoin.sh InstallChaincode.sh QueryChaincode.sh
$ curl https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh | bash -s -- 1.4.0 1.4.0 -d -s
$ cp ./bin/cryptogen ./bin/configtxgen ./bin/orderer ./bin/peer ./bin/configtxlator .
```

## 2. Fabric Network Start
