#!/bin/bash

sudo apt-get update
sudo apt-get install curl
sudo apt-get install wget
sudo apt-get install vi
sudo apt-get install ssh
sudo apt-get update

# Install Docker
echo "##############################################"
echo "             Install Docker"
echo "##############################################"
sudo apt-get remove docker docker-engine docker.i

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

sudo apt-get update
sudo apt-get install docker-ce -y

sudo usermod -a -G docker $USER

#Install Docker Compose
echo "##############################################"
echo "           Install Docker Compose"
echo "##############################################"
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo apt-get update

#Install Go Language
echo "##############################################"
echo "                   Go Lang"
echo "##############################################"
sudo apt-get install golang -y
sudo apt-get update

export PATH=/usr/local/go/bin:$PATH
export GOROOT=$HOME/go

mkdir Network
cd Network

echo "##############################################"
echo "             Fabric Binary"
echo "##############################################"
curl https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh | bash -s -- 1.4.0 1.4.0 -d -s
