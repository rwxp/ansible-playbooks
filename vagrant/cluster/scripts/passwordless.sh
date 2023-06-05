#!/bin/bash

function write_log(){
  local text=$1
  echo $text >> passwordless.log 
}

# Create a private and public ssk keys
function setting_up_ssh_keys(){

  local host_password=$3

  echo "=> Setting up private and public ssh keys"
  write_log "=> Setting up private and public ssh keys"

  # Checking if the mpi ssh key already exists
  if [ -f "${HOME}/.ssh/id_rsa" ]
  then
    echo "You already have an ssh key"
    write_log "You already have an ssh key"
  else
    echo "Creating a folder '${HOME}/.ssh/' for SSH keys"
    write_log "Creating a folder '${HOME}/.ssh/' for SSH keys"

    # Creating a folder to hold SSH keys
    mkdir -p "${HOME}/.ssh/"

    echo "Creating the private and public ssh keys"
    write_log "Creating the private and public ssh keys"

    # Creationg the public and private keys
    ssh-keygen -q -t rsa -N '' -f "${HOME}/.ssh/id_rsa" <<<y >/dev/null 2>&1
  fi
  echo "Setting up private and public ssh keys finished succesfully"
  write_log "Setting up private and public ssh keys finished succesfully"
}

# Send the public ssh key to a slave node
function share_ssh_public_key(){
  echo "=> Share public ssh key"
  write_log "=> Share public ssh key"

  local host_username=$1
  local host_address=$2
  local host_password=$3

  echo "host_username: $host_username, host_address: $host_address, host_password: $host_password"

  # Checking if the mpi ssh key already exists
  if [ -f "${HOME}/.ssh/id_rsa" ]
  then
    echo "Sharing the public key with $host_username@$host_address"
    write_log "Sharing the public key with $host_address"
    # Sharing the public key with the remote slave
    sshpass -p "'$host_password'" ssh-copy-id -i "${HOME}/.ssh/id_rsa" "$host_username@$host_address"
  else
    echo "You dont have ssh keys to share." >&2
    write_log "You dont have ssh keys to share."
  fi
}

# MAIN
setting_up_ssh_keys 'vagrant'
share_ssh_public_key 'vagrant' '10.0.0.2' 'vagrant'
share_ssh_public_key 'vagrant' '10.0.0.3' 'vagrant'
share_ssh_public_key 'vagrant' '10.0.0.4' 'vagrant'
