## 1. Vagrant up

#### Network Settings

* node1 192.168.56.2
* node2 192.168.56.3

```
$ vagrant up node1 node2

Bringing machine 'node1' up with 'virtualbox' provider...
==> node1: Importing base box 'node1'...
==> node1: Matching MAC address for NAT networking...
==> node1: Setting the name of the VM: Settings4_node1_1567783473400_36835
==> node1: Clearing any previously set network interfaces...
==> node1: Preparing network interfaces based on configuration...
    node1: Adapter 1: nat
    node1: Adapter 2: hostonly
==> node1: Forwarding ports...
    node1: 22 (guest) => 2222 (host) (adapter 1)
==> node1: Running 'pre-boot' VM customizations...
==> node1: Booting VM...
==> node1: Waiting for machine to boot. This may take a few minutes...
    node1: SSH address: 127.0.0.1:2222
    node1: SSH username: vagrant
    node1: SSH auth method: private key
    node1:
    node1: Vagrant insecure key detected. Vagrant will automatically replace
    node1: this with a newly generated keypair for better security.
    node1:
    node1: Inserting generated public key within guest...
    node1: Removing insecure key from the guest if it's present...
    node1: Key inserted! Disconnecting and reconnecting using new SSH key...
==> node1: Machine booted and ready!
==> node1: Checking for guest additions in VM...
    node1: The guest additions on this VM do not match the installed version of
    node1: VirtualBox! In most cases this is fine, but in rare cases it can
    node1: prevent things such as shared folders from working properly. If you see
    node1: shared folder errors, please make sure the guest additions within the
    node1: virtual machine match the version of VirtualBox you have installed on
    node1: your host and reload your VM.
    node1:
    node1: Guest Additions Version: 5.1.38
    node1: VirtualBox Version: 6.0
==> node1: Setting hostname...
==> node1: Configuring and enabling network interfaces...
==> node1: Mounting shared folders...
    node1: /vagrant => /Users/has3ong/Desktop/Github/Fabric_NetworkSetting/Settings4
==> node1: Running provisioner: shell...
    node1: Running: /var/folders/yq/4wxz887d6sb1xh2zqf9l4_100000gn/T/vagrant-shell20190907-11680-1gjjm9j.sh
```

## 2. Connet Vagrant

```
$ vagrant ssh node1

vagrant@node1:~$ ls
Network

$ cd Network
$ ls

Fabric_NetworkSetting  fabric-samples
```

## 3. Node1 Setting

```
$ vagrant ssh node1

vagrant@node1:~$ cd Network
vagrant@node1:~$ ls

bin  bootstrap.sh  config  Fabric_NetworkSetting  fabric-samples

$ mv fabric-samples/chaincode .
$ cp -rf Fabric_NetworkSetting/Settings3/node1/* .
$ rm -rf Fabric_NetworkSetting fabric-samples bootstrap.sh
```

## 4. Node2 Setting

```
$ vagrant ssh node2

vagrant@node2:~$ cd Network
vagrant@node2:~$ ls

bin  bootstrap.sh  config  Fabric_NetworkSetting  fabric-samples

$ mv fabric-samples/chaincode .
$ cp -rf Fabric_NetworkSetting/Settings3/node2/* .
$ rm -rf Fabric_NetworkSetting fabric-samples bootstrap.sh
```

## /etc/hosts Settings
```
$ sudo vi /etc/hosts
192.168.56.2	orderer.example.com
192.168.56.2	peer0.org1.example.com
192.168.56.2	peer1.org1.example.com
192.168.56.3	peer0.org2.example.com
192.168.56.3	peer1.org2.example.com
```