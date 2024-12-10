# nspr
PKG_VER=4.36
PKG_URL="https://archive.mozilla.org/pub/nspr/releases/v${PKG_VER}/src/nspr-${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
AUTOCONF_PATH=nspr
CONF_PATH=nspr
CONF_FLAGS="--with-mozilla --with-pthreads"
if [ "${HARCH_BITWIDTH}" == "64" ]
then
    CONF_FLAGS+=" --enable-64bit"
fi
#PKG_MAKETARGETS="all,install"

PKG_PREBUILD="sed -ri '/^RELEASE/s/^/#/' nspr/pr/src/misc/Makefile.in"
PKG_FAULTYCFLAGS=1
PKG_TOOLCHAIN=gnu