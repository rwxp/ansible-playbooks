#!/bin/bash

# Install Ansible
sudo apt-get update
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

# Configure ansible hosts file
sudo echo "[cluster]" >> /etc/ansible/hosts
sudo echo "ss2023-00 ansible_host=10.0.0.2 ansible_port=22 ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/id_rsa" >> /etc/ansible/hosts
sudo echo "ss2023-01 ansible_host=10.0.0.3 ansible_port=22 ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/id_rsa" >> /etc/ansible/hosts
sudo echo "ss2023-02 ansible_host=10.0.0.4 ansible_port=22 ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/id_rsa" >> /etc/ansible/hosts

cd "/vagrant/scripts"
bash passwordless.sh



