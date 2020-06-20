- [Steps for connecting to Master Node](#steps-for-connecting-to-master-node)
  - [Follow below documentation for kubeadm, kubectl & kubelet installation.](#follow-below-documentation-for-kubeadm-kubectl--kubelet-installation)
  - [Reset existing kubeadm nodes](#reset-existing-kubeadm-nodes)
  - [Connect to Master](#connect-to-master)

# Steps for connecting to Master Node

Below steps helps to install, reset existing(optional) and connect to master nodes.

## Follow below documentation for kubeadm, kubectl & kubelet installation.

But skip master node part and follow below steps in this doc for connecting to master nodes.

* [ubuntu16](./ubuntu16-kubeadm.md)
* [centos7](./centos7-kubeadm.md)
* [container linkux](./ContainerLinux-with-kubeadm.md)

## Reset existing kubeadm nodes

If you have existing and working kubeadm nodes that is already been connected to master, please use the following command to reset it before connecting to the new master.

```
ubuntu@rpi1:~$ sudo kubeadm reset -F
# -F flag to reset without confirmation

ubuntu@rpi1:~$ sudo rm -rf /etc/cni/net.d

ubuntu@rpi1:~$ sudo iptables -F
```

## Connect to Master

TODO