#!/usr/bin/env bash

# Speed up SSH logins
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

exit 0

