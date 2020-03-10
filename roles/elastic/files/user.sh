#! bin/bash

if grep eco /etc/group
then
  echo Group eco exists
else
  groupadd eco > /dev/null 2>&1
fi



if grep eco /etc/passwd
then
  echo User eco exists
else
  useradd -g eco eco > /dev/null 2>&1
fi