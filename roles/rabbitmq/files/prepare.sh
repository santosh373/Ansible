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
touch ${RPM_BUILD_ROOT}/etc/sysconfig/rabbitmq


cp ${RPM_BUILD_ROOT}/opt/pace/rabbitmq/bin/rabbitmq.init  ${RPM_BUILD_ROOT}/etc/init.d/rabbitmq


cp ${RPM_BUILD_ROOT}/opt/pace/rabbitmq/curator/conf/rotateCurator  ${RPM_BUILD_ROOT}/etc/logrotate.d/

