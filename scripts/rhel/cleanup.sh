#!/usr/bin/env bash

# Clen up rhel specific stuff
echo "Removing repo definition."
rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo

# Remove MAC from network interface config
sed -i "s/HWADDR=.*//" /etc/sysconfig/network-scripts/ifcfg-eth0

exit 0

