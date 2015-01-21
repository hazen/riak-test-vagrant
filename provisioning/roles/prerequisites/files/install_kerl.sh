#!/bin/bash
if [ ! -d /usr/local/kerl ]; then
    cd /usr/local
    sudo git clone https://github.com/yrashk/kerl
fi

BASHRC=~/.bashrc
EXISTS=`grep /usr/local/kerl ${BASHRC}`
if [ -z "$EXISTS" ]; then
   cat <<EOF >> ${BASHRC}
export PATH=\${PATH}:/usr/local/kerl
EOF
fi
