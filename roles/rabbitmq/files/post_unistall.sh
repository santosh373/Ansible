

#! /bin/bash

# Remove all files that were overwritten by the config package.
echo -n "Removing the /opt/pace/rabbitmq directory and all subdirectories.";
echo "Preserving the logs and data directories.";
for dir in `find /opt/pace/rabbitmq -maxdepth 1 -type d | egrep -v 'rabbitmq$|logs$|data$'`; do
  rm -rf ${dir};
done;
%files
%defattr(-,eco,eco)
/opt/pace/rabbitmq
/collect/data
%config /etc/sysconfig/rabbitmq
%attr(755,root,root) /etc/init.d/rabbitmq
%attr(644,root,root) /etc/logrotate.d/rotateCurator
