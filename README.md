# [KubeZilla Community Collaborative Project](https://kubezilla.com)
[![Gitter](https://img.shields.io/gitter/room/DAVFoundation/DAV-Contributors.svg?style=flat-square)](https://gitter.im/kubezilla/community) 


## Special Thanks

**DigitalOcean sponsored $500 credits to provision Multi-master nodes for HA*****
 

We are aiming to build a largest Kubernetes Community Cluster and target to showcase it on OSCONF Kochi Day.

## Why are we doing this?

It's great opportunity for community members to learn, collaborate and contribute around Kubernetes and related technologies. As a team, we will learn how Kubernetes cluster is setup, how apps gets deployed over Cloud and what kind of microservices can be run possibly on these HUGE cluster nodes.Community members will learn how monitoring tools like Prometheus and Grafana can be deployed and fetch time-series metrics out of these HUGE cluster of nodes. In nutshell, it's 2-3 hour effort which will let every single individual to learn Kubernetes and understand its scalability.

## When? 

> We are targeting 27th June starting 2:00 PM till 4:00 PM for Kubezilla. [Refer to Issue #6](https://github.com/collabnix/kubezilla/issues/6)

| Activity  |      Date      |        Time        |
| :-------: | :------------: | :----------------: |
| Rehearsal | 21st June 2020 |11:00 AM to 1:00 PM |
| Live Demo | 27th June 2020 | 2:00 PM to 4:00 PM |


## How shall I join my worker node?

It's simple. Follow the below steps:

### Installing Docker

```
curl -sSL https://get.docker.com/ | sh
```

## Run the below container 

**Make sure to update the label below before running.**

> Very Important

Node can be **node=cloud** or **node=rpi** or **node=jetson**

**name=<your_name>**

```
sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/rancher-agent:v2.4.5 --server https://success.kubezilla.com --token xg8sm7fgxgls7p52rcjbkjsszp2cb8l4gmfqpvxt48s65dcqhjvqww --worker --label node=cloud --label name=kubezilla
```

That's it. Open up success.kubezilla.com with kubezilla as login and kubezilla as password


## Contribution Proposal

  1. Create a pull request if you're interested to contribute your FREE Cloud instance(AWS/Azure/GCP/DO).
  2. You can even contribute Your Raspberry Pi too if you know how to connect it to this cluster.
  3. Please also include your full name, Twitter's handle *and* your company name.
  4. Please note that the node's specification for this run is **XGB of RAM with X vCore**.
  We're sorry that 512MB will be not enough for our testing.
  
  
  ## What's mininum requirements of a node?
  

- 2 GB or more of RAM per machine (any less will leave little room for your apps)
- 2 CPUs or more
- Full network connectivity between all machines in the cluster (public or private network is fine)
- Unique hostname, MAC address, and product_uuid for every node. See here for more details.
- Certain ports are open on your machines. See here for more details.
- Swap disabled. You MUST disable swap in order for the kubelet to work properly.
- TCP	Inbound	10250	open for Kubelet API	
- TCP	Inbound	30000-32767 open for NodePort Services

## Size of Master & Master Components


On GCE/Google Kubernetes Engine, and AWS, kube-up automatically configures the proper VM size for your master depending on the number of nodes in your cluster. On other providers, you will need to configure it manually. 

For reference, the sizes we use on GCE are

```
1-5 nodes: n1-standard-1
6-10 nodes: n1-standard-2
11-100 nodes: n1-standard-4
101-250 nodes: n1-standard-8
251-500 nodes: n1-standard-16
more than 500 nodes: n1-standard-32
```

And the sizes we use on AWS are

```
1-5 nodes: m3.medium
6-10 nodes: m3.large
11-100 nodes: m3.xlarge
101-250 nodes: m3.2xlarge
251-500 nodes: c4.4xlarge
more than 500 nodes: c4.8xlarge
```

# Ports required to be open on Worker Nodes

```
TCP     10250       Kubelet API
TCP     10255       Read-Only Kubelet API
```

## Contributors


| Name                                                                                                                                                       |                Company                | Number of Nodes<br>Expected to Contribute |             Machine Type             |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | :-----------------------------------: | :---------------------------------------: | :----------------------------------: |
| [@ajeetsraina](https://twitter.com/ajeetsraina)                                                                                                            |               Collabnix               |                    10                     |                                      |
| [@anmolnagpal](https://twitter.com/anmol_nagpal)<br/>([github](https://github.com/anmolnagpal)) ([linkedin](https://www.linkedin.com/in/anmolnagpal/))        | [CloudDrove Inc.](https://clouddrove.com) |                    45                     | t3.medium/t3a.medium (2 vCPUs, 4 GB) |
| [@cube8021](https://twitter.com/cube8021)                                                                                                                  |             Rancher Labs              |                     5                     |                                      |
| [@dostiharise](https://twitter.com/dostiharise)<br/>([github](https://github.com/dostiharise)) ([linkedin](https://www.linkedin.com/in/harikrishnaganji/)) | [Alvyl Consulting](https://alvyl.com) |                    32                     | t3.medium/t3a.medium (2 vCPUs, 4 GB) |
| [@dostiharise](https://twitter.com/dostiharise)<br/>([github](https://github.com/dostiharise)) ([linkedin](https://www.linkedin.com/in/harikrishnaganji/)) | [Alvyl Consulting](https://alvyl.com) |                     3                     |         Raspberry Pis 3B+/4B         |
| [@vinayaggarwal](https://twitter.com/vnyagarwal)                                                                                                           |                Dellemc                |                     2                     |                                      |
| [@josanabr](https://twitter.com/josanabr)                                                                                                                  |               Personal                |                     2                     |         Raspberry Pis 3B+/4B         |
| [@kvenu](https://www.linkedin.com/in/kumaresan-venu-91649aa1/)                                                                                             |               Personal                |                     2                     |                                      |
| [@MeenachiSundaram](https://twitter.com/vmeenachis) <br/>([github](https://github.com/MeenachiSundaram)) ([linkedin](https://www.linkedin.com/in/meenz/))  |               Personal                |                     2                     |           Raspberry Pis 4B           |
| [@stefscherer](https://twitter.com/stefscherer)                                                                                                                    |           [Docker Inc.](https://docker.com)           |                     2                     |          Raspberry Pis 3B+                 |
| [@stefscherer](https://twitter.com/stefscherer) [Docker Inc.](https://docker.com)           |                     10                     |          Azure (5x D8s, 5x D32s)                 |
| [@ginigangadharan](https://twitter.com/ginigangadharan)  
| [@omkarjoshi](https://www.linkedin.com/in/omkarj/) 

                                                                                                                  |           Your Company Name           |                     8                     |                                      |


## Beginner's Guide
If you're an individual and it's your first time joining KubeZilla, we encourage you to *not* contribute more than 50 nodes.

## Setting up Master Node

- [Click Here](https://github.com/collabnix/kubezilla/blob/master/master/README.md)

## Goals
- This is the 1st collaborative project powered by Collabnix Slack community to form 100+ nodes
- This is being planned on the latest Kubernetes version
-  Networking; We will be creating a large subnet /20 and trying to assign, as many as possible, IP addresses to each container on each node distributedly. We expect to have around ~1k IP addresses assigned and the workload application should be working fine.
- Once 100+ K8s cluster is setup, we will be running an application to see the performance
- We will be using Prometheus as well as Grafana for visualisation

## Results
All experimental results will be provided publicly for all of you to analyze, write blogs,
or even used as information for further development of your own commercial projects. Please feel free to use it.

## Who's behind Kubezilla?

Kubezilla is a non-profit project organized by Docker Captains [Ajeet Singh Raina](https://twitter.com/ajeetsraina). If you want to be part of the organization team or support through sponsorship, please send us a DM in Gitter. 

## Feel difficulty raising pr for contributing here ?
go and add your nodes [here](https://docs.google.com/forms/d/e/1FAIpQLScoezFOQjtXUY2U0bkxdyr0BXTR__1ARufoJNd1l5m8idewrQ/viewform?usp=sf_link)
