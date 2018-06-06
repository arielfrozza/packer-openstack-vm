#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "stack  ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

apt-get update
apt-get -y upgrade
apt-get -y install git vim

