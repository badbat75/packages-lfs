# brotli
PKG_VER=1.0.9
PKG_URL="https://github.com/google/brotli/archive/v${PKG_VER}/brotli-${PKG_VER}.tar.gz"
PKG_DEPS=""
BUILD_PROCESS=cmakebuild
CONF_FLAGS=
PKG_MAKETARGETS="all,install/strip"

PKG_PREBUILD="sed -i 's@-R..libdir.@@' scripts/*.pc.in"