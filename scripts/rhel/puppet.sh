#!/usr/bin/env bash
#
# This bootstraps Puppet on Enterprise Linux.
#
set -e

# Determine out the OS major version
OS_MAJ_VER=`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release) | cut -c 1`
REPO_URL="http://yum.puppetlabs.com/puppetlabs-release-el-${OS_MAJ_VER}.noarch.rpm"

# Install the PuppetLabs repository
echo "Configuring PuppetLabs repo..."
REPO_PATH=$(mktemp)
wget --output-document="${REPO_PATH}" "${REPO_URL}" 2>/dev/null
rpm -i "${REPO_PATH}" >/dev/null
rm -f $REPO_PATH >/dev/null

# Install puppet stuff
yum -y install puppet hiera facter >/dev/null
echo "Puppet installed!"

exit 0

