# file
PKG_VER=5.45
PKG_URL="http://ftp.astron.com/pub/file/file-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/zlib lfs/xz lfs/bzip2"
case ${PKG_TARGET} in
    native|cross) PKG_DEPS= ;;
    *) PKG_DEPS="lfs/zlib lfs/bzip2 lfs/file:cross" ;;
esac
#PATCHES=
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
