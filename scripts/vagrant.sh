#!/usr/bin/env bash

# Add build date and time
date > /etc/vagrant_box_build_time

# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /etc/motd

# Setup vagrant user
echo 'Setting up home directory of user vagrant.'
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

exit 0

