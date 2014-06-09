#!/usr/bin/env vagrant

# Setup sudo to allow no-password sudo for "sudo"
echo 'Setting up sudo privileges for user vagrant.'
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

exit 0

