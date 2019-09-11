## 1. Vagrant up

#### Network Settings

* Org1 192.168.56.2
* Org2 192.168.56.3
* Orderer1 192.168.56.4
* Orderer2 192.168.56.5
* Orderer3 192.168.56.6


```
vagrant up Org1 Org2 Orderer1 Orderer2 Orderer3
```

## 2. Connet Vagrant

```
$ vagrant ssh {Orderer1, Orderer2, Orderer3, Org1, Org2}

vagrant@:~$ ls
Network

$ cd Network
$ ls

Fabric_NetworkSetting  fabric-samples

$ sudo mv fabric-samples/chaincode .
$ sudo mv Fabric_NetworkSetting/Settings2/{your VM name}/* .
$ sudo rm -rf fabric-samples Fabric_NetworkSetting

$ ls
```
