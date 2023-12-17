# Ansible Playbooks

This repo includes ansible playbooks to automate the provisioning of several machines with a single command. We provide a list of available playbooks as follows:

**Ubuntu 18.04 LTS**
 - cluster: NFS based cluster.
 - jupyterhub: jupyterlab
 - users: users creation/deletion
 - cuda 10 (nvidia-driver-410,nvidia-driver-390,cuda)
 - docker (docker.io,nvidia-docker2)
 - openmpi 3.1.2 (NFS, passwordless, openmpi)
 - singularity 
 - gromacs 2018

### About Ansible

Ansible is an **Agentless** Configuration Management Tool commonly used to automate three types of tasks: Provisioning, Configuration Manangement and Application Deployment. Ansible considers two kind of machines:

- Control Machines (CM)
- Machines Under Configuration (MUC)

Passwordless (instructions below) is required between a Control Machine and Machines Under Configuration because Ansible use SSH to perform the configuration of these machines. Control and Under Configuration Machines require Python.

### Use playbooks with a Cluster of Virtual Machines

* Get into the **vagrant** folder an deploy the Virtual Machines Cluster defined there. This cluster is already configued to test the playbooks defined in this repo.

### Use playbooks in another enviorment.

* Install Ansible in your PC (It will be the Control Machine)

```sh
sudo apt-get update
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get install ansible -y
sudo apt-get install python -y
```

* Tell Ansible how to communicate with each machine

The Ansible Invertiry File is the way we use to indicate Ansible how to access remote machines. The inventory file is commonly located at */etc/ansible/hosts*.

```sh
sudo nano /etc/ansible/hosts
```

Ansible will need to create a private key and copy this key to every Under Control Machine you need Ansible perform some instalation.

```sh
[cluster]
ss2023-00 ansible_host=127.0.0.1 ansible_port=22 ansible_user=vagrant ansible_ssh_private_key_file=/home/<username>/.ssh/private_key
```

* Test if Ansible is able to connect to each Under Control Machine.

```sh
ansible -m ping cluster
```


# Automatic provisioning
* To initiate automatic provisioning the first step is to create an IP list (ips.txt) within the Vagrant vars folder.

```
nano vagrant/vars/ips.txt 
```
IP list (ips.txt) should follow the next model:
**IP File Model:**
```
- [Master Node IP]
- [Node 1 IP]
- [Node 2 IP]
- ...
- [Node N IP]
```
* To execute the interactive menu and select the desired Ansible playbook, run the following Vagrant command:
```
vagrant up
```
This command will initiate the provisioning process and prompt you to choose the Ansible playbook you want to apply, input the number of the desired playbook and press Enter to continue.

Each ip specified in IP file will create a private network, which allows host-only access to the machine
using a specific IP.
Once the machines are up the bash scripts are executed to enable the SSH passwordless connection to guarantee the execution of the selected playbook.

As soon as SSH passwordless access is ensured, and the machines are operational, Ansible playbooks can be effortlessly executed within the cluster.

# References

- [How to install Ansible on Ubuntu Server 18.04](https://www.techrepublic.com/article/how-to-install-ansible-on-ubuntu-server-18-04/)
- [What is Ansible?](https://cloudacademy.com/blog/what-is-ansible/)
- [Provisioning Vagrant multi-machines with Ansible](https://medium.com/@megawan/provisioning-vagrant-multi-machines-with-ansible-32e1809816c5)
- [Ansible - A Beginner's Tutorial, Part 2
](https://www.youtube.com/watch?v=pRZA9ymZXn0)




