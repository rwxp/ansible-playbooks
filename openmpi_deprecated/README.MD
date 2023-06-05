# OpenMPI 3.1.2 Ansible Playbook

This playbook includes:

* OpenMPI install
* Passworldless setting
* NFS setting up (/home/mpiuser) by default
* MPI Processes can be lauched from any cluster node

Some requirements for OpenMPI 3.1.2

* Hostnames can't be written with ```_``` (underscore) beacuse it cause erros when parsing hostnames like "slave_1".

## Prepare Playbook

Edit the file *openmpi/basic/vars/main.yml* and add the hosts names and IP addresses that will be included in the */etc/hosts* file on each under control computer.

```sh
mpi_hosts:
  - { name: m, ip: 10.0.0.2 }
```

By default, the NFS server for the OpenMPI exports the folder  */home/mpiuser*. If you require another folder to be shared, set the valiarble **nfs_exports** in  *openmpi/master/vars/main.yml*.

```sh
nfs_exports:
  - /home/mpiuser *(rw,sync,no_root_squash,no_subtree_check)
```

Additionally, you need to set the variable **nfs_imports** in *openmpi/slave/vars/main.yml* to macth the configuratio performed for the NFS server. **m** is the name of the NFS server and */home/mpiuser* is the filesystem to be mounted in NFS clients.

```sh
nfs_imports:
  - { name: /home/mpiuser, src: 'm:/home/mpiuser', type: nfs }
```

## Run

For this example, we user a cluster of vagrant machines. Additionally, we consider the connection module *paramiko* because *smart* fails somethimes.

```sh
ansible-playbook playbook.yml -c paramiko 
```

For other machines, remote machines user will require to promnt the user paswword.

```sh
ansible-playbook playbook.yml -K -c paramiko 
```

## Todo 

- [ ] Reboot NFS server when installed
