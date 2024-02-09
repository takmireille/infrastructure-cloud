#!/bin/bash

# Installation de kubeadm, kubelet et kubectl
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubeadm kubelet kubectl

# Initialisation du nœud maître avec kubeadm
sudo kubeadm init --apiserver-advertise-address=185.252.232.95 --pod-network-cidr=192.168.0.0/16

# Configuration de l'accès kubectl pour l'utilisateur courant
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Installation du réseau de pod (par exemple, Calico)
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
