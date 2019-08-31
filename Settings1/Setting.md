## 1. Vagrant Ubuntu install

```
$ vagrant box add ubuntu/xenial64
==> box: Loading metadata for box 'ubuntu/xenial64'
    box: URL: https://vagrantcloud.com/ubuntu/xenial64
==> box: Adding box 'ubuntu/xenial64' (v20190807.0.0) for provider: virtualbox
    box: Downloading: https://vagrantcloud.com/ubuntu/boxes/xenial64/versions/20190807.0.0/providers/virtualbox.box
    box: Download redirected to host: cloud-images.ubuntu.com
==> box: Successfully added box 'ubuntu/xenial64' (v20190807.0.0) for 'virtualbox'!

# Box(Image) 목록 확인

$ vagrant box list
ubuntu/xenial64 (virtualbox, 20190830.0.0)

$ vagrant plugin install vagrant-disksize
Installing the 'vagrant-disksize' plugin. This can take a few minutes...
Fetching: vagrant-disksize-0.1.3.gem (100%)
Installed the plugin 'vagrant-disksize (0.1.3)'!
```

## 2. Vagrant up

```
$ vagrant up
```

## 3. Connet Vagrant

```
$ vagrant ssh node1

vagrant@node1:~$ ls
fabric-samples
```