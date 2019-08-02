## 1. Virtual Box & Ubuntu Install

Ubuntun Version = 16.04.6
* http://ftp.kaist.ac.kr/ubuntu-cd/16.04/ubuntu-16.04.6-server-amd64.iso


* VM Count : 2
* VM Name : node1, node2
* CPU : 2
* Memory : 1 ~ 2 GB
* Disk : 15GB ~

Insert Ubuntu Netowrk Adapter

```
$ ifconfig

docker0   Link encap:Ethernet  HWaddr 02:42:98:05:5c:67
          inet addr:172.17.0.1  Bcast:172.17.255.255  Mask:255.255.0.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

enp0s3    Link encap:Ethernet  HWaddr 08:00:27:57:ca:06
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fe57:ca06/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:352 errors:0 dropped:0 overruns:0 frame:0
          TX packets:96 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:428882 (428.8 KB)  TX bytes:8090 (8.0 KB)

enp0s8    Link encap:Ethernet  HWaddr 08:00:27:4b:89:26
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:127 errors:0 dropped:0 overruns:0 frame:0
          TX packets:110 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:11397 (11.3 KB)  TX bytes:15267 (15.2 KB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:172 errors:0 dropped:0 overruns:0 frame:0
          TX packets:172 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:12560 (12.5 KB)  TX bytes:12560 (12.5 KB)
``` 

Initialize network information in enp0s8 Adapter

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

$ sudo systemctl restart networking
```

## 2. Docker Install

Docker Engine Delete

```
$ sudo apt-get remove docker docker-engine docker.i
```

depedencies package install

```
$ sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
software-properties-common
```

Add ocker repository GPG key

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

$ sudo add-apt-repository \
 "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) \
 stable"
```

Docker Install

```
$ sudo apt-get update
$ sudo apt-get install docker-ce
```

Docker version check

```
$ sudo usermod -a -G docker $USER

$ docker version
Client:
 Version:           18.09.7
 API version:       1.39
 Go version:        go1.10.8
 Git commit:        2d0083d
 Built:             Thu Jun 27 17:56:17 2019
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          18.09.7
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.8
  Git commit:       2d0083d
  Built:            Thu Jun 27 17:23:02 2019
  OS/Arch:          linux/amd64
  Experimental:     false
```
## 3. Docker Compose Install

```
$ sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

$ sudo chmod +x /usr/local/bin/docker-compose
```

Docker Compose Check

```
$ docker-compose --version
docker-compose version 1.23.2, build 1110ad01
```