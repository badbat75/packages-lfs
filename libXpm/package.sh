# libXpm
PKG_VER=3.5.16
PKG_URL="https://www.x.org/pub/individual/lib/libXpm-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/xorgproto lfs/libX11 lfs/libXext lfs/ncompress:cross"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
