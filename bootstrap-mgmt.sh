#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
sudo yum -y install epel-release
sudo yum -y install updates
sudo yum -y install ansible
sudo yum install -y gcc python-pip python-devel openssl-devel
sudo pip install -y molecule

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  mgmt
10.0.15.11  master
10.0.15.21  worker1
10.0.15.22  worker2
EOL
