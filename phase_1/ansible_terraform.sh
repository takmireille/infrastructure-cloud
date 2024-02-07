#!/bin/bash

# Mise à jour du système
sudo apt update && sudo apt upgrade -y

# Installation de Terraform
echo "Installation de Terraform..."
sudo apt install -y unzip
TERRAFORM_VERSION="1.0.11"  # Remplacez par la version de Terraform souhaitée
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Installation d'Ansible
echo "Installation d'Ansible..."
sudo apt install -y ansible

# Affichage des versions installées
echo "Terraform version : $(terraform -v)"
echo "Ansible version : $(ansible --version | head -n1)"

# Vérification de l'installation de Terraform
echo "Vérification de l'installation de Terraform..."
terraform --version > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Terraform est installé avec succès."
else
    echo "Erreur : Terraform n'a pas pu être installé."
fi

# Vérification de l'installation d'Ansible
echo "Vérification de l'installation d'Ansible..."
ansible --version > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Ansible est installé avec succès."
else
    echo "Erreur : Ansible n'a pas pu être installé."
fi
