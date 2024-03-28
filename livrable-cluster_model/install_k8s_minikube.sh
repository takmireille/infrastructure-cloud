#!/bin/bash
# installer kubectl
curl -LO https://dl.k8s.io/release/v1.29.2/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
# Téléchargement de la dernière version de Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

# Déplacer l'exécutable dans le répertoire /usr/local/bin (pour qu'il soit accessible globalement)
sudo usermod -aG docker tak && newgrp docker
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/

# Vérification de l'installation
minikube version
minikube start --nodes 2 -p multinode-demo # profil

