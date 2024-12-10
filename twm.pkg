# twm
PKG_VER=1.0.12
PKG_URL="https://www.x.org/pub/individual/app/twm-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native"
PKG_DEPS+=" lfs/libX11 lfs/libXext lfs/libXt lfs/libXmu lfs/libICE lfs/libSM lfs/xorgproto lfs/libXrandr"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed -e '/^rcdir =/s,^\\(rcdir = \\).*,\\1/etc/X11/app-defaults,' -i src/Makefile.am"