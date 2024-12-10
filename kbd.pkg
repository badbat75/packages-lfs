# kbd
PKG_VER=2.6.4
PKG_URL="https://www.kernel.org/pub/linux/utils/kbd/kbd-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/doxygen:native lfs/gzip"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--disable-vlock"
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure.ac
    sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in"