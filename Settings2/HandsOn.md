## 0. Zookeeper Leader Election

Zookeeper Leader

```
zookeeper1.example.com   | 2019-09-11 14:43:19,479 [myid:2] - INFO  [QuorumPeer[myid=2]/0.0.0.0:2181:QuorumPeer@856] - LEADING
zookeeper1.example.com   | 2019-09-11 14:43:19,482 [myid:2] - INFO  [QuorumPeer[myid=2]/0.0.0.0:2181:Leader@59] - TCP NoDelay set to: true
zookeeper1.example.com   | 2019-09-11 14:43:19,483 [myid:2] - INFO  [QuorumPeer[myid=2]/0.0.0.0:2181:ZooKeeperServer@173] - Created server with tickTime 2000 minSessionTimeout 4000 maxSessionTimeout 40000 datadir /datalog/version-2 snapdir /data/version-2
zookeeper1.example.com   | 2019-09-11 14:43:19,484 [myid:2] - INFO  [QuorumPeer[myid=2]/0.0.0.0:2181:Leader@361] - LEADING - LEADER ELECTION TOOK - 224
```

Zookeeper Leader Election
```
zookeeper0.example.com   | 2019-09-11 14:40:35,778 [myid:1] - INFO  [QuorumPeer[myid=1]/0.0.0.0:2181:Follower@61] - FOLLOWING - LEADER ELECTION TOOK - 37
zookeeper0.example.com   | 2019-09-11 14:40:35,779 [myid:1] - INFO  [QuorumPeer[myid=1]/0.0.0.0:2181:QuorumPeer$QuorumServer@149] - Resolved hostname: 192.168.56.5 to address: /192.168.56.5
zookeeper0.example.com   | 2019-09-11 14:40:35,784 [myid:1] - INFO  [QuorumPeer[myid=1]/0.0.0.0:2181:Learner@326] - Getting a diff from the leader 0x160000003e
zookeeper0.example.com   | 2019-09-11 14:40:35,788 [myid:1] - INFO  [QuorumPeer[myid=1]/0.0.0.0:2181:FileTxnSnapLog@240] - Snapshotting: 0x160000003e to /data/version-2/snapshot.160000003e

zookeeper2.example.com   | 2019-09-11 14:44:29,809 [myid:3] - INFO  [QuorumPeer[myid=3]/0.0.0.0:2181:Follower@61] - FOLLOWING - LEADER ELECTION TOOK - 42
zookeeper2.example.com   | 2019-09-11 14:44:29,810 [myid:3] - INFO  [QuorumPeer[myid=3]/0.0.0.0:2181:QuorumPeer$QuorumServer@149] - Resolved hostname: 192.168.56.5 to address: /192.168.56.5
zookeeper2.example.com   | 2019-09-11 14:44:29,818 [myid:3] - INFO  [QuorumPeer[myid=3]/0.0.0.0:2181:Learner@329] - Getting a snapshot from leader
zookeeper2.example.com   | 2019-09-11 14:44:29,823 [myid:3] - INFO  [QuorumPeer[myid=3]/0.0.0.0:2181:FileTxnSnapLog@240] - Snapshotting: 0x1800000005 to /data/version-2/snapshot.1800000005
```

# Orderer Setting

## 1. Create certificate and channel artifacts

## 2.Start Fabric Network


# Peer Setting

## 1. Create certificate and channel artifacts

## 2.Start Fabric Network