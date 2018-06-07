#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "stack  ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

apt-get update
apt-get -y upgrade
apt-get -y install git vim

echo '' >> /etc/network/interfaces
echo '#The contents below were added by Packer. Do not modify.' >> /etc/network/interfaces
echo 'auto eth1' >> /etc/network/interfaces
echo 'iface eth1 inet static' >> /etc/network/interfaces
echo '      address 192.168.56.111' >> /etc/network/interfaces
echo '      netmask 255.255.255.0' >> /etc/network/interfaces
echo '      nameservers 8.8.8.8' >> /etc/network/interfaces
