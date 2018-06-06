#!/bin/bash -eux

git clone -b stable/pike https://git.openstack.org/openstack-dev/devstack.git /home/stack/devstack/

echo '[[local|localrc]]' > /home/stack/devstack/local.conf
echo 'ADMIN_PASSWORD=password' >> /home/stack/devstack/local.conf
echo 'MYSQL_PASSWORD=password' >> /home/stack/devstack/local.conf
echo 'RABBIT_PASSWORD=password' >> /home/stack/devstack/local.conf
echo 'SERVICE_PASSWORD=password' >> /home/stack/devstack/local.conf
echo 'SERVICE_TOKEN=password' >> /home/stack/devstack/local.conf
echo "" >> /home/stack/devstack/local.conf
echo 'HOST_IP=192.168.56.111' >> /home/stack/devstack/local.conf
echo 'SERVICE_HOST=$HOST_IP' >> /home/stack/devstack/local.conf
