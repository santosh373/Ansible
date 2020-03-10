#! bin/bash

# Add elasticsearch to start on boot
chkconfig --add elasticsearch
chkconfig elasticsearch on

ELASTICSEARCHHOME="/opt/pace/elasticsearch"

# Ensure proper file ownership
chown -R eco:eco ${ELASTICSEARCHHOME}
chmod 755 ${ELASTICSEARCHHOME}/bin/elasticsearch.init
chmod a+x ${ELASTICSEARCHHOME}/share/elasticsearch/bin/*
chmod a+x ${ELASTICSEARCHHOME}/jdk/bin/*
chmod a+x /opt/pace/elasticsearch/curator/rhel6/curator
chmod a+x /opt/pace/elasticsearch/curator/rhel7/curator
