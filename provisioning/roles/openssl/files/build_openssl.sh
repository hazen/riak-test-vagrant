#!/bin/bash
cd /usr/local/src
export OPENSSL=openssl-1.0.2-latest
wget https://www.openssl.org/source/${OPENSSL}.tar.gz
tar fx ${OPENSSL}.tar.gz
cd openssl*
export CFLAGS=-fPIC
./config shared -no-ssl2 --openssldir=/usr/local/openssl
make depend
make
make test
sudo make install 2>&1 > install.log
sudo mkdir -p /usr/local/opt
cd /usr/local/opt
sudo rm -f /usr/local/opt/openssl
sudo ln -s /usr/local/openssl openssl

# vagrant user environment
BASHRC=${HOME}/.bashrc
EXISTS=`grep "Add OpenSSL" ${BASHRC}`
if [ -z "$EXISTS" ]; then
   cat <<EOF >> ${BASHRC}

# Add OpenSSL to vagrant user environment
export PATH=/usr/local/opt/openssl/bin:\${PATH}
export CPATH=/usr/local/otp/openssl/include:\${CPATH}
export C_INCLUDE_PATH=/usr/local/otp/openssl/include:\${C_INCLUDE_PATH}
export LIBRARY_PATH=/usr/local/opt/openssl/lib:\${LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/local/opt/openssl/lib:\${LD_LIBRARY_PATH}
EOF
fi
