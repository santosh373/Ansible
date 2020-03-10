#! bin/bash

# Add rabbitmq to start on boot
chkconfig --add rabbitmq-server
chkconfig rabbitmq-server on

RABBITMQHOME="/opt/pace/rabbitmq"

#rm -rf ${RABBITMQHOME}/rabbitmq/bin
#mv ${RABBITMQHOME}/rabbitmq/* ${RABBITMQHOME}
#rm -rf ${RABBITMQHOME}/rabbitmq
# Ensure proper file ownership
chown -R eco:eco ${RABBITMQHOME}
chmod 755 ${RABBITMQHOME}/bin/rabbitmq-server
chmod a+x ${RABBITMQHOME}/usr/sbin/*