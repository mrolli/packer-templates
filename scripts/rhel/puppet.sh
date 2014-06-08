#!/usr/bin/env bash

# Prepare puppetlabs repo
cat > /etc/yum.repos.d/puppetlabs.repo << EOM
[puppetlabs-dependencies]
name=puppetlabdsdependencies
baseurl=http://yum.puppetlabs.com/el/6/dependencies/\$basearch
enabled=1
gpgcheck=0

[puppetlabs]
name=puppetlabs
baseurl=http://yum.puppetlabs.com/el/6/products/\$basearch
enabled=1
gpgcheck=0
EOM

# Install puppet stuff
yum -y install puppet facter hiera ruby-shadow

exit 0

