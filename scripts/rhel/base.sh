#!/usr/bin/env bash

set -e

# Determine the OS major version and EPEL release package name
OS_MAJ_VER=`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release) | cut -c 1`
PLATFORM=`uname -i`
EPEL_PKG="epel-release-latest-${OS_MAJ_VER}.noarch.rpm"
REPO_URL="http://linuxsoft.cern.ch/epel/${EPEL_PKG}"

# Install the EPEL repository
echo "Configuring EPEL repository for ${EPEL_PKG}."
REPO_PATH=$(mktemp)
curl -k -L $REPO_URL -o $REPO_PATH
rpm -i "${REPO_PATH}" >/dev/null
rm -f $REPO_PATH >/dev/null

# Install packages that are dependencies later in the process
echo 'Installing packages for dependency.'
yum -y install gcc make gcc-c++ kernel-devel-`uname -r` kernel-headers-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils ntpdate >/dev/null
echo "Dependencies installed"

exit 0

