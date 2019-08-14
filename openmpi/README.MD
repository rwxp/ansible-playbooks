# OpenMPI 3.1.2 Ansible Playbook

This playbook includes:

* OpenMPI install
* Passworldless setting
* NFS setting up (/home/mpiuser) by default
* MPI Processes can be lauched from any cluster node

Some requirements for OpenMPI 3.1.2

* Hostnames can't be written with ```_``` (underscore) beacuse it cause erros when parsing hostnames like "slave_1".

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

* How to set ssh keys in computer under control
* Restart NFS before install
* Restart NFS clients before mount
* Add indications of the variables to be configured to run this script properly


## Issues

When the play was executed as first time, this error appears. When running the playbook again this does not happend anymore. 

```sh
TASK [basic : Running MPI ./configure (this can take a few seconds) ...] *****************************************************************************
fatal: [slave_2]: FAILED! => {"msg": "Timeout (12s) waiting for privilege escalation prompt: "}
fatal: [slave_1]: FAILED! => {"msg": "Timeout (12s) waiting for privilege escalation prompt: "}
	to retry, use: --limit @/home/aureavm/Desktop/ci/Ansible/playbooks/openmpi/playbook.retry
```