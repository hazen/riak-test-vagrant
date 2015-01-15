#!/bin/bash
PROFILE=${HOME}/.bash_profile
BASHRC=${HOME}/.bashrc
if [ ! -f ${PROFILE} || -z "`grep .bashrc ${PROFILE}`"]; then
cat <<EOF >> ${PROFILE}
if [ -f ${HOME}/.bashrc ]; then
    source ${HOME}/.bashrc
fi
EOF
fi
if [ ! -f ${BASHRC} || -z "`grep EDITOR ${BASHRC}" ]; then
   cat <<EOF >> ${BASHRC}
## Uncomment to use the Enterprise Edition of Riak
# export RT_USE_EE=Y
## Modify the location of the versions of Riak
# export RT_DEST_DIR
export EDITOR=vim
EOF
fi

## Update the color settting for the Mac
sed -i.bak "s/xterm-color/xterm-256color/g" ${BASHRC}
