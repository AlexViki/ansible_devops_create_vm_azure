# Create VM azure via Ansible

### Task:
- Create new instants via Ansible;
- Install NGINX, Jenkins to instants via Ansible
- Set basic auth authorization to WEB-server (NGINX);

### Expected result:
- You have to have a pipeline that runs from a local machine and as a result you have to get a virtual machine with Jenkins through the base authorization in NGINX or Apache.

---------------------------------------------------------------------------------------------------

### You need to copy this script to your local sh script and run it from your CLI
- script will install all necessary package for running "Ansible" file
- use Azure service principal for authorization "az ad sp create-for-rbac --name AnsibleService" before running this script
- create folder "/secret" and thee files "url" "pass" "tenant" and copy to these files results which return "Azure service principal"

---------------------------------------------------------------------------------------------------
```
#!/bin/bash
URL=`cat ~/secret/url`
PASS=`cat ~/secret/pass`
TENANT=`cat ~/secret/tenant`

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
echo "Installnstall ansible and ansible Azure module"
echo "###########################################################"
sudo apt-get update
sudo apt-get install -y libssl-dev libffi-dev python-dev python-pip
sudo pip install ansible
sudo pip install ansible[azure]
echo "###########################################################"
echo "Installnstall GIT"
echo "###########################################################"
sudo apt-get install git -y
echo "###########################################################"
echo "Clone playbook file from GIT"
echo "###########################################################"
git clone https://github.com/AlexViki/ansible_devops_create_vm_azure.git
echo "###########################################################"
echo "RUN playbook "
echo "###########################################################"
ansible-playbook -i ~/ansible_devops_create_vm_azure/hosts ~/ansible_devops_create_vm_azure/create_vm.yml
echo "###########################################################"
echo
echo "-------------END-------------"
```
---------------------------------------------------------------------------------------------------
