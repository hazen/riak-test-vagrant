#!/bin/bash
PROFILE=${HOME}/.bash_profile
BASHRC=${HOME}/.bashrc
if [ ! -f ${PROFILE} ] || [ -z "`grep .bashrc ${PROFILE}`"]; then
cat <<EOF >> ${PROFILE}
if [ -f ${HOME}/.bashrc ]; then
    source ${HOME}/.bashrc
fi
EOF
fi
if [ ! -f ${BASHRC} ] || [ -z "`grep EDITOR ${BASHRC}`" ]; then
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
#if [ "$color_prompt" = yes ]; then
#    PS1='\[\033[00;33;33m\]\w\[\033[00m\]:\[\033[00;32m\]$(__git_ps1 "%s")\[\033[00m\]\n${debian_chroot:+($debian_chroot)}\[\033[0;31m\]\u@\h\[\033[00m\] \$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w:$(__git_ps1 "%s")\$ '
#fi
