#!/usr/bin/env bash
# add sshkey to authorized_keys
cat /opt/installs/vkey.pem.pub >> /home/vagrant/.ssh/authorized_keys
#Java Install
sudo yum install -y java-1.8.0-openjdk
sudo yum install -y epel-release
