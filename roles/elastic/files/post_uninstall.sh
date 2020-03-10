#! /bin/bash

# Remove all files that were overwritten by the config package.
echo -n "Removing the /opt/pace/elasticsearch directory and all subdirectories.";
echo "Preserving the logs and data directories.";
for dir in `find /opt/pace/elasticsearch -maxdepth 1 -type d | egrep -v 'elasticsearch$|logs$|data$'`; do
  rm -rf ${dir};
done;
%files
%defattr(-,eco,eco)
/opt/pace/elasticsearch
/collect/data
%config /etc/sysconfig/elasticsearch
%attr(755,root,root) /etc/init.d/elasticsearch
%attr(644,root,root) /etc/logrotate.d/rotateCurator