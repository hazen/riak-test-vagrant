#!/bin/bash
LIMIT_FILE=/etc/security/limits.conf
EXISTS=`grep vagrant ${LIMIT_FILE}`
if [ -z "$EXISTS" ]; then
    cat <<EOF | sudo tee -a ${LIMIT_FILE}
vagrant soft nofile 65536
vagrant hard nofile 65536
EOF
fi
