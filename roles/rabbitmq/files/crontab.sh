#! bin!/bash

set crontab

crontab -u eco -l | grep -v -E 'curator' > /tmp/eco.cron;
echo "0 */24 * * * LC_ALL=en_US.utf8 /opt/pace/rabbitmq/curator/rhel6/curator --config /opt/pace/rabbitmq/curator/conf/config /opt/pace/rabbitmq/curator/conf/cleanup_action >> /opt/pacerabbitmq/logs/curator.log 2>&1" >> /tmp/eco.cron;
crontab -u eco /tmp/eco.cron
rm -f /tmp/eco.cron

