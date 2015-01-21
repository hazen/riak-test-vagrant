#!/bin/bash
PROFILE=~/.bash_profile
EXISTS=`grep java-7-oracle ${PROFILE}`
if [ -z "$EXISTS" ]; then
   cat <<EOF >> ${PROFILE}
export PATH=/usr/lib/jvm/java-7-oracle/bin:\${PATH}
EOF
fi
