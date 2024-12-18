# libunwind
PKG_VER=1.6.2
PKG_URL="https://download.savannah.nongnu.org/releases/libunwind/libunwind-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/libXt lfs/libXext lfs/libX11"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"

case ${TOOLCHAIN} in
    gnu) PKG_CFLAGS="-Wno-incompatible-pointer-types" ;;
    llvm) PKG_CFLAGS="-Wno-implicit-function-declaration" ;;
esac