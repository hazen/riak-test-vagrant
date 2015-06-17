#!/bin/bash
PROFILE=~/.bash_profile
if [ "$1" == "rhel" ]; then
  JAVA_HOME=/usr/java/jdk1.7.0_79
else
  JAVA_HOME=/usr/lib/jvm/java-7-oracle
fi
EXISTS=`grep jdk ${PROFILE}`
if [ -z "$EXISTS" ]; then
  cat <<EOF >> ${PROFILE}
export JAVA_HOME=${JAVA_HOME}
export PATH=\${JAVA_HOME}/bin:\${PATH}
EOF
fi
