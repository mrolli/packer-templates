#!/usr/bin/env bash

# Speed up SSH logins
echo "Tweaking sshd_config settings."
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

exit 0

