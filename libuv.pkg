# libuv
PKG_VER=1.44.2
PKG_URL="https://dist.libuv.org/dist/v${PKG_VER}/libuv-v${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="echo \"m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [\$UV_EXTRA_AUTOMAKE_FLAGS])\" \
    > m4/libuv-extra-automake-flags.m4"