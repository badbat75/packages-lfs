# flex
PKG_VER=2.6.4
PKG_URL="https://github.com/westes/flex/releases/download/v${PKG_VER}/flex-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/bison:native"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_ENV="HELP2MAN=$(which true)"
CONF_FLAGS="--docdir=${INSTALL_SHAREDIR}/doc/flex-${PKG_VER}"
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed -i \"/math.h/a #include <malloc.h>\" src/flexdef.h"

case ${PKG_TARGET} in
    native)
        PKG_CHECK="[ x$(${GLOBAL_TOOLCHAIN_PATH}/bin/flex --version 2>/dev/null | awk '{print $2}' || : ) == x${PKG_VER} ]"
    ;;
esac