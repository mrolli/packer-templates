#!/usr/bin/env bash

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso

# Install the VirtualBox guest additions
echo 'Installing VirtualBox guest additions.'
mount -o loop /home/vagrant/$VBOX_ISO /mnt
yes|sh /mnt/VBoxLinuxAdditions.run --nox11 >/dev/null
umount /mnt

# Cleanup
rm -f /home/vagrant/$VBOX_ISO

exit 0

