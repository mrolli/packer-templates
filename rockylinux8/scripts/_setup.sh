#!/bin/sh -eux

# Add build date and time
date > /root/.vagrantbox_buildtime

vbox_iso=VBoxGuestAdditions_$(cat /home/vagrant/.vbox_version).iso
build_deps="bzip2 elfutils-libelf-devel gcc kernel-devel make perl"


#
# VirtualBox Guest Additions
#
echo 'Installing VirtualBox guest additions.'
# Install build dependencies
dnf -y install $build_deps >/dev/null
# Install the VirtualBox guest additions here
echo 'Installing VirtualBox guest additions.'
mount -o loop /home/vagrant/$vbox_iso /mnt
yes|sh /mnt/VBoxLinuxAdditions.run --nox11 >/dev/null
umount /mnt
# cleanup
rm -f /home/vagrant/$vbox_iso
dnf -y erase $build_deps >/dev/null
dnf clean all
