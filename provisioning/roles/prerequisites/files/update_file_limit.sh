#!/bin/bash
if [ "$1" == "rhel" ]; then
  LIMIT_FILE=/etc/security/limits.d/95-riak.conf
else
  LIMIT_FILE=/etc/security/limits.conf
fi
EXISTS=`grep "nofile 65536" ${LIMIT_FILE}`
if [ -z "$EXISTS" ]; then
    cat <<EOF | sudo tee -a ${LIMIT_FILE}
* soft nofile 65536
* hard nofile 65536
EOF
fi
