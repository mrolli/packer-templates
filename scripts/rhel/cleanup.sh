#!/usr/bin/env bash

# Clen up rhel specific stuff
echo "Removing repo definition."
rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo

exit 0

