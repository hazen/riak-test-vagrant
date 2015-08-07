#!/bin/bash
ERLN8=/usr/local/erln8
cd /usr/local/src
if [ ! -d /usr/local/src/erln8 ]; then
    git clone https://github.com/metadave/erln8
    cd erln8
    make
    cd ..
fi
if [ ! -d ${ERLN8} ]; then
    cd erln8
    sudo PREFIX=${ERLN8} make install
    ${ERLN8}/bin/erln8 --init
fi

BASHRC=${HOME}/.bashrc
EXISTS=`grep ${ERLN8}/bin ${BASHRC}`
if [ -z "$EXISTS" ]; then
   cat <<EOF >> ${BASHRC}
export PATH=\${PATH}:${ERLN8}/bin
EOF
fi
