#!/usr/bin/env bash

vbox_iso=VBoxGuestAdditions_$(cat /home/vagrant/.vbox_version).iso
build_deps="build-essential linux-headers-$(uname -r) nfs-common dkms"


# Add build date and time
date > /root/.vagrantbox_buildtime

#
# Prepare vagrant user
#
#echo 'Setting up home directory of user vagrant.'
#mkdir -pm 700 /home/vagrant/.ssh
curl 'https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub' -o /home/vagrant/.ssh/authorized_keys
#chmod 0600 /home/vagrant/.ssh/authorized_keys
#chown -R vagrant:vagrant /home/vagrant/.ssh
# Adding vagrant to sudoers is done in preseed.cfg


#
# sshd configuration
#
echo "Speeding up SSH logins."
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config


#
# VirtualBox Guest Additions
#
#echo 'Installing VirtualBox guest additions.'
## Install build dependencies
#apt-get -y install $build_deps >/dev/null
## Install the VirtualBox guest additions here
#echo 'Installing VirtualBox guest additions.'
#mount -o loop /home/vagrant/$vbox_iso /mnt
#yes|sh /mnt/VBoxLinuxAdditions.run --nox11 >/dev/null
#umount /mnt
## cleanup
#rm -f /home/vagrant/$vbox_iso
#apt-get -y remove --purge  $build_deps >/dev/null
#apt-get clean
