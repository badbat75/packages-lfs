# tar
PKG_VER=1.35
PKG_URL="http://ftp.gnu.org/gnu/tar/tar-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/gzip"
BUILD_PROCESS=configmake
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
