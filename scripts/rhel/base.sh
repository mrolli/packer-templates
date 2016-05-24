#!/usr/bin/env bash

set -e

# Determine out the OS major version and EPEL release package name
OS_MAJ_VER=`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release) | cut -c 1`
PLATFORM=`uname -i`

case $OS_MAJ_VER in
  6)
    EPEL_PKG='epel-release-6-8.noarch.rpm'
  ;;
  7)
    EPEL_PKG='e/epel-release-7-6.noarch.rpm'
  ;;
  *)
    echo "Unsupported rhel major version: ${OS_MAJ_VER}" >&2
    exit 1
  ;;
esac

REPO_URL="http://mirror.switch.ch/ftp/mirror/epel/${OS_MAJ_VER}/${PLATFORM}/${EPEL_PKG}"

# Install the EPEL repository
echo "Configuring EPEL repository for ${EPEL_PKG} on ${PLATFORM}."
REPO_PATH=$(mktemp)
curl -k -L $REPO_URL -o $REPO_PATH
rpm -i "${REPO_PATH}" >/dev/null
rm -f $REPO_PATH >/dev/null

# Install packages that are dependencies later in the process
echo 'Installing packages for dependency.'
yum -y install gcc make gcc-c++ kernel-devel-`uname -r` kernel-headers-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils ntpdate >/dev/null
echo "Dependencies installed"

exit 0

