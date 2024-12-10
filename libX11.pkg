# libX11
PKG_VER=1.8.4
PKG_URL="https://www.x.org/archive/individual/lib/libX11-${PKG_VER}.tar.xz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--disable-malloc0returnsnull"
PKG_MAKETARGETS="all,install-strip"

case ${PKG_TARGET} in
    bootstrap)
        PKG_DEPS="lfs/xmlto:native"
        PKG_DEPS+=" lfs/libxcb:bootstrap"
        PKG_DEPS+=" lfs/xtrans:bootstrap"
    ;;
    *)
        PKG_DEPS="lfs/xmlto:native"
        PKG_DEPS+=" lfs/libxcb"
        PKG_DEPS+=" lfs/xtrans lfs/fontconfig"
    ;;
esac
