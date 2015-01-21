#!/bin/bash
OPENSSL=/usr/local/opt/openssl
KERL=/usr/local/kerl/kerl
INSTALLDIR=${HOME}/erlang
export KERL_CONFIGURE_OPTIONS="--enable-smp-support --without-odbc --with-ssl=${OPENSSL} --enable-hipe --enable-m64-build"
export CFLAGS="-g -O2"
export LDFLAGS="-g"
for release in R15B01 R15B03; do
    if [ -z "`${KERL} list builds | grep ${release}`" ]; then
         ${KERL} build ${release} ${release}
#        KERL_CONFIGURE_OPTIONS="--enable-vm-probes --with-dynamic-trace=dtrace --enable-smp-support --without-odbc --with-ssl=/usr/local/opt/openssl --with-javac=/usr/lib/jvm/java-7-oracle/bin --enable-hipe" ${KERL}/${KERL} build ${release} ${release}
    fi
    if [ -z "`${KERL} list installations | grep ${release}`" ]; then
        ${KERL} install ${release} ${INSTALLDIR}/${release}
    fi
done
RELEASE=R16B02-basho8
GIT_LABEL=r16
if [ -z "`${KERL} list builds | grep ${RELEASE}`" ]; then
    ${KERL} build git git://github.com/basho/otp.git ${GIT_LABEL} ${RELEASE}
fi
if [ -z "`${KERL} list installations | grep ${RELEASE}`" ]; then
    ${KERL} install ${RELEASE} ${INSTALLDIR}/${RELEASE}
fi

## Add riak_test goodies to the test environment
BASHRC=${HOME}/.bashrc
if [ -z "`grep CURRENT_OTP ${BASHRC}`" ]; then
    cat <<EOF >> ${BASHRC}
# Location of Erlang OTP installations
export R15B01=${INSTALLDIR}/R15B01
export R16B02=${INSTALLDIR}/R16B02-basho8
export CURRENT_OTP=${INSTALLDIR}/R16B02-basho8
EOF
fi
if [ -n "`which erln8`" ]; then
    erln8 --id=R15B01 --link ${INSTALLDIR}/R15B01
    erln8 --id=R15B03 --link ${INSTALLDIR}/R15B03
    erln8 --id=R16B02-basho8 --link ${INSTALLDIR}/${RELEASE}
    sed -i.bak "s/^system_default=$/system_default=${RELEASE}/g" ${HOME}/.erln8.d/config
fi
