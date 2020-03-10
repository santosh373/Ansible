#! /bin/bash


/etc/init.d/elasticsearch stop || echo "elasticsearch server isn't running"
# Remove elasticsearch from start on boot
chkconfig --del elasticsearch
# Remove curator cron jobs from eco user
crontab -u eco -l | grep -v -E 'curator' > /tmp/eco.cron;
crontab -u eco /tmp/eco.cron
rm -f /tmp/eco.cron