#!bin/bash

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install docker.io

sudo usermod -aG docker $USER

sudo systemctl start docker

sudo systemctl enable docker

# installing kubernetes

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

sudo apt-get install curl -y

sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

sudo apt-get install kubeadm kubelet kubectl -y

sudo hostnamectl set-hostname "${server_name}"