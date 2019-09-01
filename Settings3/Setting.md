## 1. Initalize node1 node2 host file

Virtual Box Host Network Setting
<img width="600" src="https://user-images.githubusercontent.com/44635266/64060634-ab77b880-cc0a-11e9-87f0-6a83fd392d10.png">

VM Network Setting
<img width="600" src="https://user-images.githubusercontent.com/44635266/64060635-ac104f00-cc0a-11e9-9e0c-d37a9e31bcc4.png">

Ubuntu 16.04(Server) Install

* node1 VM - 192.168.56.2
* node2 VM - 192.168.56.3
```
$ sudo vi /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enp0s3
iface enp0s3 inet dhcp

auto enp0s8
iface enp0s8 inet static
address 192.168.56.2
netmask 255.255.255.0
network 192.168.56.0
```

#### SSH Networking

```
$ ssh node1@192.168.56.2
The authenticity of host '192.168.56.2 (192.168.56.2)' can't be established.
ECDSA key fingerprint is SHA256:tJpPmEWWdj2LCKyvljWDLJrAtCEKeWpd1G1uBHu7gf4.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.56.2' (ECDSA) to the list of known hosts.
node1@192.168.56.2's password:
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

패키지 118개를  업데이트할 수 있습니다.
76 업데이트는 보안 업데이트입니다.

New release '18.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Sat Aug 31 16:32:43 2019
node1@ubuntu:~$
```

## 2. Install Docker

```
$ sudo apt-get remove docker docker-engine docker.i

$ sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
software-properties-common

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

$ sudo add-apt-repository \
 "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) \
 stable"

$ sudo apt-get update
$ sudo apt-get install docker-ce

$ sudo usermod -a -G docker $USER

$ docker version

```

## 3. Install Docker Compose
```
$ sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

$ sudo chmod +x /usr/local/bin/docker-compose

$ docker-compose --version
```
## 4. Install Fabric