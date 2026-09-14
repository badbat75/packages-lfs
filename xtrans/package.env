# xtrans
PKG_VER=1.4.0
PKG_URL="https://www.x.org/archive/individual/lib/xtrans-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/xmlto:native"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"

case ${PKG_TARGET} in
    bootstrap)
        PKG_DEPS+=" lfs/libxcb:bootstrap"
    ;;
    *)
        PKG_DEPS+=" lfs/libxcb"
        PKG_DEPS+=" lfs/fontconfig"
    ;;
esac
