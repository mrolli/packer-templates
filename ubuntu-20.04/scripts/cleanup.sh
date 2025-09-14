#!/usr/bin/env bash

# Remove cloud.init config
sudo apt-get clean
FILE=/etc/cloud/cloud.cfg.d/50-curtin-networking.cfg
if test -f "$FILE"; then
  sudo rm $FILE
fi

FILE=/etc/cloud/cloud.cfg.d/curtin-preserve-sources.cfg
if test -f "$FILE"; then
  sudo rm $FILE
fi

FILE=/etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
if test -f "$FILE"; then
  sudo rm $FILE
fi

# Removing leftover leases and persistent rules
echo 'Cleaning up dhcp leases.'
sudo rm -f /var/lib/dhcp/*

echo 'Zeroing free space on device (this may take a while).'
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sudo sync
