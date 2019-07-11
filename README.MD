# Ansible Playbooks

This repo includes ansible playbooks to automate the provisioning of several machines with a single command. We provide a list of available playbooks as follows:

**Ubuntu 18.04 LTS**
 - cuda 10 (nvidia-driver-410,nvidia-driver-390,cuda)
 - docker (docker.io,nvidia-docker2)
 - openmpi 3.1.2 (NFS, passwordless, openmpi)
 - singularity 
 - gromacs 2018

### About Ansible

Ansible is an **Agentless** Configuration Management Tool commonly used to automate three types of tasks: Provisioning, Configuration Manangement and Application Deployment. Ansible considers to kind of machines:

- Control Machines (CM)
- Machines Under Configuration (MUC)

Passwordless is required between a Control Machine and Machines Under Configuration because Ansible use SSH to perform the configuration of these machines. Control and Under Configuration Machines require python to be installed.

### Lets Play with the Playbooks

* Deploy a Virtual Machines Cluster in your PC with Vagrant (They will be the Under Control Machines) [here](https://github.com/DonAurelio/vagrant).
* Install Ansible in your PC (It will be the Control Machine)

```sh
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get install ansible -y
sudo apt-get install python -y
```

* Tell Ansible how to communicate with each virtual machine.

The Ansible Invertiry File is the way we use to indicate Ansible hot to access remote machines. The inventory file located at */etc/ansible/hosts*.

```sh
nano /etc/ansible/hosts
```

Ansible will use the privated keys provided by vagrant to access the cluster deployed with vagrant.

```sh
[vagrant_cluster]
master ansible_host=127.0.0.1 ansible_port=2222 ansible_user=vagrant ansible_ssh_private_key_file=/home/username/Desktop/vagrant/cluster/.vagrant/machines/master/virtualbox/private_key
slave_1 ansible_host=127.0.0.1 ansible_port=2200 ansible_user=vagrant ansible_ssh_private_key_file=/home/username/Desktop/vagrant/cluster/.vagrant/machines/slave_1/virtualbox/private_key
slave_2 ansible_host=127.0.0.1 ansible_port=2201 ansible_user=vagrant ansible_ssh_private_key_file=/home/username/Desktop/vagrant/cluster/.vagrant/machines/slave_2/virtualbox/private_key
```

* Test if all machines are listening Ansible.

```sh
ansible -m ping vagrant_cluster
```

# Todo

- Steps to configure a real cluster passwordless.

# References

- [How to install Ansible on Ubuntu Server 18.04](https://www.techrepublic.com/article/how-to-install-ansible-on-ubuntu-server-18-04/)
- [What is Ansible?](https://cloudacademy.com/blog/what-is-ansible/)
- [Provisioning Vagrant multi-machines with Ansible](https://medium.com/@megawan/provisioning-vagrant-multi-machines-with-ansible-32e1809816c5)
- [Ansible - A Beginner's Tutorial, Part 2
](https://www.youtube.com/watch?v=pRZA9ymZXn0)



