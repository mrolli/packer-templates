#!/usr/bin/env bash

echo "Deleting package manager caches..."
if type apt-get >/dev/null 2>&1; then
    apt-get clean
fi

if type yum >/dev/null 2>&1; then
    yum clean all
fi

echo "Zeroing device to make space..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sync

exit 0

