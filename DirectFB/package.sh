# DirectFB (deprecated)
PKG_VER=1.6.3
PKG_URL="https://src.fedoraproject.org/repo/pkgs/directfb/DirectFB-1.6.3.tar.gz/641e8e999c017770da647f9b5b890906/DirectFB-1.6.3.tar.gz"
PKG_DEPS=lfs/fluxcomp:cross
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=
PKG_MAKETARGETS=",install-strip"

case ${TOOLCHAIN} in
    llvm)
        PKG_CFLAGS="-Wno-int-conversion -Wno-enum-conversion"
        PKG_CXXFLAGS="-std=c++11"
    ;;
esac