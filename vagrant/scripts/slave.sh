#!/bin/bash 
cd "/vagrant"
cat "id_rsa.pub" >> "/home/vagrant/.ssh/authorized_keys"