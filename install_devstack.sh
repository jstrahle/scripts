#!/bin/bash
yum update -y
yum install -y git yum-utils nano
useradd -d /opt/stack -m -s /bin/bash stack
echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
cat <<EOT >> /opt/stack/local.conf
[[local|localrc]]
ADMIN_PASSWORD=changemeplz
DATABASE_PASSWORD=\$ADMIN_PASSWORD
RABBIT_PASSWORD=\$ADMIN_PASSWORD
SERVICE_PASSWORD=\$ADMIN_PASSWORD
#Use if needed: FLOATING_RANGE="192.168.43.72/29"
#Use if needed: Q_FLOATING_ALLOCATION_POOL=start=192.168.43.73,end=192.168.43.78
EOT
echo "Copy-paste this to install: git clone https://git.openstack.org/openstack-dev/devstack; cp ~/local.conf ~/devstack/; cd ~/devstack/; ./stack.sh"
su - stack
