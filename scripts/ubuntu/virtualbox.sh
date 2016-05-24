#!/usr/bin/env bash

# Building dynamic kenrel modules might be a good idea.
apt-get -y install dkms

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
echo 'Installing VirtualBox guest additions.'
mount -o loop /home/vagrant/$VBOX_ISO /mnt
yes|sh /mnt/VBoxLinuxAdditions.run --nox11 >/dev/null
umount /mnt

# Cleanup
rm -f /home/vagrant/$VBOX_ISO

exit 0
