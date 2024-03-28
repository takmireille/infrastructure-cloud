#!/bin/bash

# Mise à jour de l'index des paquets
sudo apt update

# Installation des dépendances pour permettre à apt d'utiliser un dépôt via HTTPS
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Ajout de la clé GPG officielle de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Ajout du référentiel Docker stable
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Mise à jour de l'index des paquets (encore une fois avec le nouveau référentiel ajouté)
sudo apt update

# Installation de Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker tak

# Vérification de l'installation en exécutant une image de test
#sudo docker run hello-world
