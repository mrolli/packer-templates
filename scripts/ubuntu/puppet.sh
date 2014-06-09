#!/usr/bin/env bash

# Prepare puppetlabs repo
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
rm -f pupetlabs-release-precise.deb
apt-get update

# Install puppet stuff
apt-get install -y puppet hiera facter

exit 0
