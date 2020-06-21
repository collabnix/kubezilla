# How to setup Master Node for Kubezilla


## Configuring the networking stuff

By default, if you run ```ifconfig``` command on your Cloud instance, it shows private IP address(and not Public).
You must add publicIP interface for kubeadm init to work. Caution: If you dont add publicIP interface, kubeadm init --apiserver-advertise-address=publicIP will not success.

Follow the below steps to configure public IP:


## Tested Environment: Ubuntu 16.04/18.04/20.04


### Step #1: Access your Cloud Instance via SSH

### Step #2:  Create the configuration file and open an editor

```
touch /etc/netplan/60-floating-ip.yaml
nano /etc/netplan/60-floating-ip.yaml
```

### Step #3:  Paste the following configuration into the editor and replace <YOUR PUBLIC IP> with your actual public IP.

IPv4:

```
network:
  version: 2
  ethernets:
    eth0:
      addresses:
      - <YOUR PUBLIC IP>/32
```


### Step #4:  Restart your network. Caution: This will reset your network connection

```
sudo netplan apply
```

### Step #5: Verify if private IP interface gets replaced by the public IP

```
$ ifconfig ens4
ens4: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1460
        inet 34.75.235.117  netmask 255.255.255.255  broadcast 0.0.0.0
        inet6 fe80::4001:aff:fe8e:3  prefixlen 64  scopeid 0x20<link>
        ether 42:01:0a:8e:00:03  txqueuelen 1000  (Ethernet)
        RX packets 487336  bytes 175945336 (175.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 409437  bytes 278796504 (278.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
 ```


### Step #6:  Initialize the Kubeadm



```
sudo kubeadm init --apiserver-advertise-address=34.75.235.117 --control-plane-endpoint=34.75.235.117 --upload-certs --pod-network-cidr 10.5.0.0/16
```

### Step #6:  Kubeconfig Configuration

```
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```


### Step #7:  Configuring Kube Router

We tested it with Calico/Weave but it kept crashing. Kube Router looks to be perfect solution.

```
kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
```

### Steps #8: Verfiying Kube components

```
$ sudo kubectl get componentstatus
NAME                 STATUS    MESSAGE             ERROR
scheduler            Healthy   ok                  
controller-manager   Healthy   ok                  
etcd-0               Healthy   {"health":"true"}   

```

### Step #9:  Ensuring kube router is up and running


```
$ sudo kubectl get po -A | grep kube
kube-system   coredns-66bff467f8-m2k4d          1/1     Running                    0          90m
kube-system   coredns-66bff467f8-s55wl          1/1     Running                    0          90m
kube-system   etcd-worker1                      1/1     Running                    0          90m
kube-system   kube-apiserver-worker1            1/1     Running                    0          90m
kube-system   kube-controller-manager-worker1   1/1     Running                    0          90m
kube-system   kube-proxy-bmz5t                  1/1     Running                    0          81m
kube-system   kube-proxy-czxns                  1/1     Running                    0          87m
kube-system   kube-proxy-f2lx9                  1/1     Running                    0          90m
kube-system   kube-proxy-fmtv5                  1/1     Running                    0          78m
kube-system   kube-proxy-gh9jf                  1/1     Running                    0          44m
kube-system   kube-proxy-kdbv6                  1/1     Running                    0          52m
kube-system   kube-proxy-sswqx                  1/1     Running                    0          47m
kube-system   kube-router-lnrkq                 1/1     Running                    0          90m
kube-system   kube-router-mmf95                 1/1     Running                    0          47m
kube-system   kube-router-nmfhc                 1/1     Running                    0          78m
kube-system   kube-router-pxkvt                 1/1     Running                    0          52m
kube-system   kube-router-q7lq6                 1/1     Running                    0          81m
kube-system   kube-router-rx4bm                 1/1     Running                    0          44m
kube-system   kube-router-xkdpd                 1/1     Running                    0          87m
kube-system   kube-scheduler-worker1            1/1     Running                    0          90m
```

### Step #10: Verify the nodes

```
$ sudo kubectl get nodes
NAME              STATUS     ROLES    AGE   VERSION
node1           Ready      master   96m   v1.18.4
```
