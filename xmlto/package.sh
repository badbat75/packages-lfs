# xmlto
PKG_VER=0.0.28
PKG_URL="https://releases.pagure.org/xmlto/xmlto-${PKG_VER}.tar.bz2"
PKG_DEPS="lfs/flex:native"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_ENV=
CONF_FLAGS=
PKG_MAKETARGETS="all,install-strip"
PKG_CFLAGS="-Wno-implicit-int"

case ${PKG_TARGET} in
    native)
        PKG_CHECK="[ x$(${GLOBAL_TOOLCHAIN_PATH}/bin/xmlto --version 2>/dev/null | awk '{print $3}' || : ) == x${PKG_VER} ]"
    ;;
esac