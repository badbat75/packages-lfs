# xz
PKG_VER=5.6.3
PKG_URL="https://tukaani.org/xz/xz-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/zlib"
BUILD_PROCESS=configmake
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
