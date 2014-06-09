#!/usr/bin/env bash

# First update to latest package state
echo 'Upgrading to latest packages state.'
apt-get -y update >/dev/null
apt-get -y dist-upgrade >/dev/null

# Install packages needed
echo 'Installing packages for dependency.'
apt-get -y install build-essential linux-headers-$(uname -r) nfs-common

# Reboot to load the new kernel
echo 'Rebooting the machine...'
reboot
sleep 60

exit 0

