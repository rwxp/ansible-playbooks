#!/bin/bash
cd /vagrant/vars
ips_file="ips.txt"
 
function read_ips_from_file() {
  if [ ! -f "$ips_file" ]; then
      echo "Error: IPs file not found: $ips_file"
      write_log "Error: IPs file not found: $ips_file"
      exit 1
  fi
  local file=$1
  local ips=()
  while IFS= read -r line; do
    ips+=("$line")
  done < "$file"
  echo "${ips[@]}"
}
ips=($(read_ips_from_file "$ips_file"))
# Install Ansible
sudo apt-get update
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get install ansible -y

# Configure ansible hosts file
sudo echo "[cluster]" >> /etc/ansible/hosts

function write_hosts(){
  local ips=("$@")
  local count=0

  for ip in "${ips[@]}"; do
    local formatted_count=$(printf "%02d" $count)
    sudo echo "ss2023-$formatted_count ansible_host=$ip ansible_port=22 ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/id_rsa" >> /etc/ansible/hosts
    ((count++))
  done
}

write_hosts "${ips[@]}"