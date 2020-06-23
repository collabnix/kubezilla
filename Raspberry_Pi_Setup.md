# Steps for setup Raspberry Pi:

1) Download the Ubuntu image for your device in your **Downloads** folder using this link:
   
   https://ubuntu.com/download/raspberry-pi/thank-you?version=18.04.4&architecture=arm64+raspi3
2) Insert your microSD card.
   
3) Unmount your microSD card with the following command:

    diskutil unmountDisk < drive address >

4)  You can now copy the image to the microSD card, using the following command:
   
    sudo sh -c 'gunzip -c ~/Downloads/ubuntu-18.04.4-preinstalled-server-arm64+raspi3.img.xz | sudo dd of=< drive address > bs=32m'

5) Make sure all machines are updated (using the commands **sudo apt-get update**)
   
6) Enable the cgroup memory:
   
   Add **cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1** to /boot/firmware/nobtcmd.txt and restart.
   
   ## Installing Docker
1) The first thing to be done is the installation of Docker. To do this, log into the pi using SSH and issue the command 
   
   **sudo apt-get install docker.io**
2) Once Docker is installed, you need to add your user to the docker group. To add your user to the docker group, issue the command:
   
    **sudo usermod -aG docker $USER**
3) Log out and log back in, so the changes will take effect.
Start and enable the docker daemon with the commands:

    **sudo systemctl start docker**

    **sudo systemctl enable docker**
   ## Installing Kubernetes
1) first add the Kubernetes GPG key with the command:
   
   **curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add**
2) If you find that curl isn’t installed (it should be), install it with the command:
   
   **sudo apt-get install curl -y**
3) Next, add the necessary repository with the command:
   
   **sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"**
4) Install the necessary software with the command:
   
   **sudo apt-get install kubeadm kubelet kubectl -y**
   
5) Joining Worker Nodes using this command:
   
    **kubeadm join --token \<token> \<control-plane-host>:\<control-plane-port> --discovery-token-ca-cert-hash sha256:\<hash>**
