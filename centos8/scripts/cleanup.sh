#!/usr/bin/env bash

# Removing leftover leases and persistent rules
echo 'Cleaning up dhcp leases.'
rm -f /var/lib/dhcp/*

echo 'Zeroing free space on device (this may take a while).'
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sync
