#!/bin/bash

#echo "Ender your DNS-name"
#read DNSNAME
URL=`cat ./secret/url`
PASS=`cat ./secret/pass`
TENANT=`cat ./secret/tenant`

echo "-------------START-------------"
echo "###########################################################"
echo "generate NEW SSH key"
echo "###########################################################"

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

echo "###########################################################"
echo "Install Azure CLI"
echo "###########################################################"

sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "###########################################################"
echo "Authorization to Azure"
echo "###########################################################"

az login --service-principal -u $URL -p $PASS --tenant $TENANT

echo "###########################################################"
echo "Installnstall ansible"
echo "###########################################################"

sudo apt update
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

echo "###########################################################"
echo "Installnstall ansible Azure"
echo "###########################################################"

sudo apt install python-pip -y
sudo pip install --user ansible[azure]
sudo apt install python-netaddr -y

echo "###########################################################"
echo "Create host file for ansible"
echo "###########################################################"

echo "localhost" > hosts

echo "###########################################################"
echo "Installnstall GIT"
echo "###########################################################"

sudo apt-get install git -y

echo "###########################################################"
echo "Clone playbook file from GIT"
echo "###########################################################"

#git clone https://github.com/AlexViki/ansible_devops_create_vm_azure_yml_file.git create_vm.yml
#wget https://github.com/AlexViki/ansible_devops_create_vm_azure/blob/master/create_vm.yml

echo "###########################################################"
echo "RUN playbook "
echo "###########################################################"

#ansible-playbook -i hosts create_vm.yml

echo "###########################################################"
echo "-------------END-------------"
