#!/usr/bin/env bash

# Removing leftover leases and persistent rules
echo "Cleaning up dhcp leases."
rm -f /var/lib/dhcp/*

# Make sure Udev doesn't block our network
echo "Cleaning up udev rules."
rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules

exit 0

