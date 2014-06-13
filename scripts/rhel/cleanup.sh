#!/usr/bin/env bash

# Clen up rhel specific stuff
echo "Removing repo definition."
yum -y erase epel-release* puppetlabs-release*

# Remove MAC from network interface config
echo "Cleaning network interface configuration."
sed -i "s/HWADDR=.*//" /etc/sysconfig/network-scripts/ifcfg-eth0

exit 0

