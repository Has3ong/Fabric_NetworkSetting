# Fabric_NetworkSetting

## Runtime Environment

* ubuntu-16.04.6-server-amd64

## Settings1

Basic Fabric Network Setting

* VM 1
* Orderer 1
* Peer 4

## Settings2

Fabric with Kafka Zookeeper Setting

* VM 5
* Orderer 3
* Peer 4
* Zookeeper 3
* Kafka 4

## Settings3 

Fabric Multi Network Setting

* VM 2
* Orderer 1
* Peer 4
* cli 1

## Settings4

Fabric RAFT Setting

* VM 1
* Orderer 5
* Peer 5
* cli 1


## Vagrant Install

* Vagrant uses Virtualbox to manage the virtual dependencies. You can directly download virtualbox and install or use homebrew for it.
```
$ brew cask install virtualbox
```
* Now install Vagrant either from the website or use homebrew for installing it.
```
$ brew cask install vagrant
```
* Vagrant-Manager helps you manage all your virtual machines in one place directly from the menubar.

```
$ brew cask install vagrant-manager
```