#!/bin/bash -eux

git clone -b stable/ocata https://git.openstack.org/openstack-dev/devstack.git /home/stack/devstack/

echo '[[local|localrc]]' > /home/stack/devstack/local.conf
echo 'ADMIN_PASSWORD=password' >> /home/stack/devstack/local.conf
echo 'MYSQL_PASSWORD=password' >> /home/stack/devstack/local.conf
echo 'RABBIT_PASSWORD=password' >> /home/stack/devstack/local.conf
echo 'SERVICE_PASSWORD=password' >> /home/stack/devstack/local.conf
echo 'SERVICE_TOKEN=password' >> /home/stack/devstack/local.conf
echo "" >> /home/stack/devstack/local.conf
echo 'HOST_IP=192.168.56.111' >> /home/stack/devstack/local.conf
echo 'SERVICE_HOST=$HOST_IP' >> /home/stack/devstack/local.conf
echo "" >> /home/stack/devstack/local.conf
echo '# HEAT' >> /home/stack/devstack/local.conf
echo 'ENABLED_SERVICES+=,h-eng,h-api,h-api-cfn,h-api-cw' >> /home/stack/devstack/local.conf
echo 'enable_plugin heat https://github.com/openstack/heat stable/ocata' >> /home/stack/devstack/local.conf
echo "" >> /home/stack/devstack/local.conf
echo '# SWIFT' >> /home/stack/devstack/local.conf
echo 'ENABLED_SERVICES+=,s-proxy,s-object,s-container,s-account' >> /home/stack/devstack/local.conf
echo 'SWIFT_HASH=password' >> /home/stack/devstack/local.conf
echo 'SWIFT_REPLICAS=3' >> /home/stack/devstack/local.conf
echo 'SWIFT_TEMPURL_KEY=password' >> /home/stack/devstack/local.conf
echo 'SWIFT_ENABLE_TEMPURLS=True' >> /home/stack/devstack/local.conf
echo "" >> /home/stack/devstack/local.conf
echo '#TEMPEST' >> /home/stack/devstack/local.conf
echo 'disable_service tempest' >> /home/stack/devstack/local.conf
