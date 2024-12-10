# libwebp
PKG_VER=1.3.0
PKG_URL="http://downloads.webmproject.org/releases/webp/libwebp-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/libjpeg-turbo"
PKG_DEPS+=" lfs/libpng"
PKG_DEPS+=" lfs/libtiff:bootstrap"
#PKG_DEPS+=" lfs/SDL"
PKG_DEPS+=" lfs/Freeglut"
#PKG_DEPS+=" lfs/giflib"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--enable-libwebpmux"
CONF_FLAGS+=" --enable-libwebpdemux"
CONF_FLAGS+=" --enable-libwebpdecoder"
CONF_FLAGS+=" --enable-libwebpextras"
CONF_FLAGS+=" --enable-swap-16bit-csp"
PKG_MAKETARGETS="all,install-strip"
