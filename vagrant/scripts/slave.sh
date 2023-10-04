#!/bin/bash 
cd "/vagrant"
cat "id_rsa.pub" > "${HOME}/.ssh/authorized_keys"