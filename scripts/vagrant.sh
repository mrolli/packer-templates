#!/usr/bin/env bash

# Add build date and time
date > /etc/vagrant_box_build_time

# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /etc/motd

# Setup vagrant user
mkdir -pm 700 /home/vagrant/.ssh
curl --insecure -L https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

exit 0

