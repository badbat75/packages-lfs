# jbig2dec
PKG_VER=0.11
PKG_URL="https://github.com/rillian/jbig2dec/archive/refs/tags/${PKG_VER}.tar.gz"
PKG_DEPS=
BUILD_PROCESS=configmake
PKG_AUTOCONF=0
CONF_FLAGS=
PKG_MAKETARGETS=",install-strip"

PKG_PREBUILD="sed '/^\$srcdir\/configure/d' -i autogen.sh
    ./autogen.sh"