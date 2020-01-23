# Docker Ansible Playbook

This playbook includes:

* docker.io
* nvidia-docker2 (requires nvidia driver)

## Prepare Playbook

Edit the file playbook.yml file to add a reference to the hosts to be provisioned. Set hosts by hostname or by IP address.

```yaml
---
- name: Setting up nodes with docker
  hosts: 
    - L
  user: clouduser
  become: true
  roles: 
    - docker.io
    - nvidia-docker2
  vars:
    user: clouduser

```

## Run

```sh
ansible-playbook -K playbook.yml
```

## Todo

- [ ] How to test the instalation