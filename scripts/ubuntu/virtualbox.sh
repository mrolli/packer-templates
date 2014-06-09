#!/usr/bin/env bash

# Building dynamic kenrel modules might be a good idea.
aptitude -y install dkms

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop /home/vagrant/$VBOX_ISO /mnt
yes|sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt

# Cleanup
rm -f /home/vagrant/$VBOX_ISO

exit 0
