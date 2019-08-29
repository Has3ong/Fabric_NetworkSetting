## Step1. Vagrant Install

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

## Step2. Create VM

#### Version

* Ubuntun 16.04.6
* Fabric  1.4.0
* vagrant 2.2.5
* Oacle VM VirtualBox 6.0.10

#### VM Settings

* CPU : 2
* Memory : 1 ~ 2 GB
* Disk : 15GB ~

```
vagrant up Org1 Org2 Orderer1 Orderer2 Orderer3
```

* install docker
* install docker-compose
* install golang
* install Fabric binary, core file

#### Network Settings

* Org1 192.168.56.2
* Org2 192.168.56.3
* Orderer1 192.168.56.4
* Orderer2 192.168.56.5
* Orderer3 192.168.56.6
