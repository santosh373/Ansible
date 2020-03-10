#! /bin/bash


/etc/init.d/rabbitmq stop || echo "rabbitmq server isn't running"
#Remove rabbitmq from start on boot
chkconfig --del elasticsearch
# Remove curator cron jobs from eco user
crontab -u eco -l | grep -v -E 'curator' > /tmp/eco.cron;
crontab -u eco /tmp/eco.cron
rm -f /tmp/eco.cron

