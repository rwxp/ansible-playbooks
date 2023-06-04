# Slurm Cluster Ansible Playbook

Deploy master node

```
ansible-playbook master.yml -K
```

Deploy computing nodes

```
ansible-playbook slave.yml -K --tags
```

ssh-keygen -q -t rsa -N '' -f /home/vagrant/.ssh/id_rsa <<<y >/dev/null 2>&1