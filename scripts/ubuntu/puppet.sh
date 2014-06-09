#!/usr/bin/env bash
#
# This bootstraps Puppet on Ubuntu
#
set -e

# Load up the release information
. /etc/lsb-release
REPO_DEB_URL="http://apt.puppetlabs.com/puppetlabs-release-${DISTRIB_CODENAME}.deb"

# Install the PuppetLabs repository
echo "Configuring PuppetLabs repo..."
REPO_DEB_PATH=$(mktemp)
wget --output-document="${REPO_DEB_PATH}" "${REPO_DEB_URL}" 2>/dev/null
dpkg -i "${REPO_DEB_PATH}" >/dev/null
rm -f $REPO_DEB_PATH >/dev/null
apt-get update >/dev/null

# Install puppet stuff
apt-get install -y puppet hiera facter >/dev/null
echo "Puppet installed!"

exit 0
