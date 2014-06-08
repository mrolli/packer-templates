#!/usr/bin/env vagrant

# Setup sudo to allow no-password sudo for "sudo"
# Groups/sudo stuff already done in ks.cfg
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

exit 0

