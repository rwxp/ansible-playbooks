#!/bin/bash

# Install Ansible
sudo apt-get update
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get install ansible -y

# Configure ansible hosts file
echo "[cluster]" >> /tmp/ansible_hosts
echo "ss2023-00 ansible_host=10.0.0.2 ansible_port=22 ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/id_rsa" >> /tmp/ansible_hosts
echo "ss2023-01 ansible_host=10.0.0.3 ansible_port=22 ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/id_rsa" >> /tmp/ansible_hosts
echo "ss2023-02 ansible_host=10.0.0.4 ansible_port=22 ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/id_rsa" >> /tmp/ansible_hosts

# Move the temporary hosts file to the correct location with elevated privileges
sudo mv /tmp/ansible_hosts /etc/ansible/hosts

# Run the passwordless.sh script without elevated privileges
bash /vagrant/scripts/passwordless.sh
