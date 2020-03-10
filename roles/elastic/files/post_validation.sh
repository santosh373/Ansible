#! /bin/bash

grep "eco - nofile 120000" /etc/security/limits.conf >/dev/null || echo "eco - nofile 120000" >> /etc/security/limits.conf

grep  "eco - nproc 120000" /etc/security/limits.d/90-nproc.conf >/dev/null || echo "eco - nproc 120000" >> /etc/security/limits.d/90-nproc.conf

grep  "vm.max_map_count = 262144" /etc/sysctl.conf >/dev/null || echo "vm.max_map_count = 262144" >> /etc/sysctl.conf

sysctl -p