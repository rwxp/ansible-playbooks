# Slurm Cluster Ansible Playbook

Deploy master node

```
ansible-playbook master.yml -K
```

Deploy computing nodes

```
ansible-playbook slave.yml -K --tags slave_only
```