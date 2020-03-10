#!/bin/bash

RPM_BUILD_ROOT=eco
RPM_SOURCE_DIR=$2
twowiresource=$3

mkdir -p ${RPM_BUILD_ROOT}/opt/pace/
mkdir -p ${RPM_BUILD_ROOT}/collect/data/
mkdir -p ${RPM_BUILD_ROOT}/etc/init.d/
mkdir -p ${RPM_BUILD_ROOT}/etc/sysconfig/
mkdir -p ${RPM_BUILD_ROOT}/etc/logrotate.d/
cd ${RPM_BUILD_ROOT}/opt/pace/


tar zxf ${RPM_SOURCE_DIR}/${twowiresource}.tar.gz
touch ${RPM_BUILD_ROOT}/etc/sysconfig/elasticsearch


cp ${RPM_BUILD_ROOT}/opt/pace/elasticsearch/bin/elasticsearch.init  ${RPM_BUILD_ROOT}/etc/init.d/elasticsearch


cp ${RPM_BUILD_ROOT}/opt/pace/elasticsearch/curator/conf/rotateCurator  ${RPM_BUILD_ROOT}/etc/logrotate.d/

cd -