# Vagrant Cluster 

This Vagrantfile specifies the deployment of a Cluster of Virtual Machines (master,slave,) on which machines can communicate to each other. This kind of enviroments are desiable to perform distrubited computations on which machines need to communicate to complete a job.

**IMPORTANT:** This Vagrantfile is configured to be ready to use ansible. However you will need to enable passwordless between the master node (Control Machine) and slave nodes (Machines Under Control). 

### Getting Started

Start cluster

```sh
vagrant up
```

Get into the one machine of the cluster (master or slave)

```sh
vagrant ssh master
vagrant ssh slave
```

Stop cluster

```sh
vagrant halt
```

Destroy cluster

```sh
vagrant destroy
```

### Ensable Passwordless for Ansible Provisioning

Get into the master machine (Control Machine) and create a ssh key.

```bash
ssh-keygen -q -t rsa -N '' -f /home/vagrant/.ssh/id_rsa <<<y >/dev/null 2>&1
```

Copy the ssh key to all the slave machines (Machines Under Control).

```bash
ssh-copy-id -i /home/<local_username>/.ssh/id_rsa <remote_username>@<ip>
```

Check if ansible is able to reach all Under Control Machines.

```bash 
ansible -m ping cluster
```

You will get the following output if Ansible is able to connect to all Under Control Machines.

```bash
ss2023-01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
ss2023-03 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

### Share Files (Virtual Machine and Host)

Vagrant enables, by default, a directory within the Virtual Machines **/vagrant** that is also shared with the folder where the Vagrantfile resides in the host machine.

### Further Information

See Virtual Machines SSH Settings

When you use ``vagrant ssh master`` vagrant know how to authenticate into the master machine using the ssh-config data. So you don't need to know the password of each machine to log into each. 

```sh
vagrant ssh-config
```

```sh
Host master
  HostName 127.0.0.1
  User vagrant
  Port 2222
  ...
  IdentityFile /home/username/Desktop/vagrant/cluster/.vagrant/machines/master/virtualbox/private_key
  ...

Host slave_1
  HostName 127.0.0.1
  User vagrant
  Port 2200
  ...
  IdentityFile /home/username/Desktop/vagrant/cluster/.vagrant/machines/slave_1/virtualbox/private_key
  ...

Host slave_2
  HostName 127.0.0.1
  User vagrant
  Port 2201
  ...
  IdentityFile /home/username/Desktop/vagrant/cluster/.vagrant/machines/slave_2/virtualbox/private_key
  ...
```



