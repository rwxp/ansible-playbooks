# Gromacs 2018 Ansible Playbook

To install gromacs the following is required:

* OpenMPI 
* Nvidia Drivers and CUDA 10


## Prepare Playbook

Edit the file *roles/basic/vars/main.yml* and change the name of the temporary directory that will be created during the instalation. change **vagrant** for your current user home dir.

```sh
gmx_temp_dir: /home/vagrant/gromacs
```

Update the *playbook.yml* with the hosts names or IP addresses and user that will be used for provisioning.

```sh 
---
- name: Setting up gromacs 2018
  hosts: 
    - A
    # - B
    - C
    - D
    - E
    - F
    - G
    - H
    - I
    - J
    - K
    - L
  user: vagrant
  roles: 
    - basic
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
