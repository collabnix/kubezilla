# KubeZilla Community Collaborative Project

   ![image](https://github.com/collabnix/kubezilla/blob/master/images/kubezilla.png)

We are aiming to build a largest Kubernetes Community Cluster and target to showcase it on OSCONF Kochi Day.

## Why are we doing this?

It's great opportunity for community members to learn, collaborate and contribute around Kubernetes and related technologies. As a team, we will learn how Kubernetes cluster is setup, how apps gets deployed over Cloud and what kind of microservices can be run possibly on these HUGE cluster nodes.Community members will learn how monitoring tools like Prometheus and Grafana can be deployed and fetch time-series metrics out of these HUGE cluster of nodes. In nutshell, it's 2-3 hour effort which will let every single individual to learn Kubernetes and understand its scalability.

## When? 

> We are targeting 27th June starting 2:00 PM till 4:00 PM for Kubezilla. [Refer to Issue #6](https://github.com/collabnix/kubezilla/issues/6)

| Activity | Date | Time |
| :-: | :-: | :-: |
| Rehearsal | TODO | TODO |
| Live Demo | 27th June 2020 | 2:00 PM to 4:00 PM |


## Contribution Proposal

  1. Create a pull request if you're interested to contribute your FREE Cloud instance(AWS/Azure/GCP/DO).
  2. You can even contribute Your Raspberry Pi too if you know how to connect it to this cluster.
  3. Please also include your full name, Twitter's handle *and* your company name.
  4. Please note that the node's specification for this run is **XGB of RAM with X vCore**.
  We're sorry that 512MB will be not enough for our testing.
  
  
  ## What's mininum requirements of a node?
  
- Rancher 
- Ubuntu 16.04+
- Debian 9+
- CentOS 7
- Red Hat Enterprise Linux (RHEL) 7
- Fedora 25+
- HypriotOS v1.0.1+
- Container Linux (tested with 1800.6.0)
- 2 GB or more of RAM per machine (any less will leave little room for your apps)
- 2 CPUs or more
- Full network connectivity between all machines in the cluster (public or private network is fine)
- Unique hostname, MAC address, and product_uuid for every node. See here for more details.
- Certain ports are open on your machines. See here for more details.
- Swap disabled. You MUST disable swap in order for the kubelet to work properly.
- TCP	Inbound	10250	open for Kubelet API	
- TCP	Inbound	30000-32767 open for NodePort Services

## Contributors


| Name          | Company       | Number of Nodes<br>Expected to Contribute | Machine Type |
| ------------- |:-------------:|:-----------------------------------------:|:-------------:|
| [@ajeetsraina](https://twitter.com/ajeetsraina) | Collabnix | 10 | |
[@anmolnagpal](https://twitter.com/anmol_nagpal) | CloudDrove Inc. | 30 | t3.medium/t3a.medium (2 vCPUs, 4 GB) |
[@cube8021](https://twitter.com/cube8021) | Rancher Labs | 5 | |
| [@dostiharise](https://twitter.com/dostiharise)<br/>([github](https://github.com/dostiharise)) ([linkedin](https://www.linkedin.com/in/harikrishnaganji/)) | [Alvyl Consulting](https://alvyl.com) | 32 | t3.medium/t3a.medium (2 vCPUs, 4 GB) |
| [@dostiharise](https://twitter.com/dostiharise)<br/>([github](https://github.com/dostiharise)) ([linkedin](https://www.linkedin.com/in/harikrishnaganji/)) | [Alvyl Consulting](https://alvyl.com) | 3 | Raspberry Pis 3B+/4B |
| [@vinayaggarwal](https://twitter.com/vnyagarwal) | Dellemc| 2 | |
| [@josanabr](https://twitter.com/josanabr)| Personal | 2 | Raspberry Pis 3B+/4B |
| [@kvenu](https://www.linkedin.com/in/kumaresan-venu-91649aa1/)| Personal | 2 | |
| [Your Name](https://twitter.com/yourid) | Your Company Name| 8 | |


## Beginner's Guide
If you're an individual and it's your first time joining KubeZilla, we encourage you to *not* contribute more than 50 nodes.




## Goals
- This is the 1st collaborative project powered by Collabnix Slack community to form 100+ nodes
- This is being planned on the latest Kubernetes version
-  Networking; We will be creating a large subnet /20 and trying to assign, as many as possible, IP addresses to each container on each node distributedly. We expect to have around ~1k IP addresses assigned and the workload application should be working fine.
- Once 100+ K8s cluster is setup, we will be running an application to see the performance
- We will be using Prometheus as well as Grafana for visualisation

## Results
All experimental results will be provided publicly for all of you to analyze, write blogs,
or even used as information for further development of your own commercial projects. Please feel free to use it.
