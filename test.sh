#!/bin/bash
#az vm image list --output table

#ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

#ansible-playbook -i hosts create_vm.yml

mkdir ~/test_folder

echo "test cloud_init" > /tmp/cloud_init.txt
echo "test cloud_init" > ~/cloud_init.txt