# libnl
PKG_VER=3.9.0
PKG_URL="https://github.com/thom311/libnl/releases/download/libnl$(echo ${PKG_VER} | sed 's/\./_/g')/libnl-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/bison:native lfs/flex:native"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--disable-debug --disable-cli"
PKG_MAKEVARS=""
PKG_MAKETARGETS="all,install-strip"
