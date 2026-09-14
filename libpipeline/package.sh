# libpipeline
PKG_VER=1.5.7
PKG_URL="https://gitlab.com/libpipeline/libpipeline/-/archive/${PKG_VER}/libpipeline-${PKG_VER}.tar.bz2"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="./bootstrap"