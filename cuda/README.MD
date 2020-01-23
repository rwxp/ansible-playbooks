# CUDA Ansible Playbook

This playbook includes:

* nvidia-dirver-390
* nvidia-driver-410 (tested in ubuntu 18.04 and Quadro K2200)
* nvidia-dirver-418 (tested in ubuntu 18.04.2 and Quadro K2200)
* cuda 10 (it supported since nvidia-driver-410 Quadro K2200)

## Prepare Playbook

Edit the file playbook.yml file to add a reference to the hosts to be provisioned. Set hosts by hostname or by IP address.

```yaml
---
- name: Setting up nodes
  hosts: 
    - m
  user: vagrant
  become: true
  roles: 
    - nvidia-driver-410
    - cuda
```

## Run

```sh
ansible-playbook -K playbook.yml
```

## Todo

* The script does not place the LD_LIBRARY_PATH in the environment. This can lead some mistakes while using cuda. 

```sh
export PATH=$PATH:/usr/local/cuda-10.0/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.0/lib64
```