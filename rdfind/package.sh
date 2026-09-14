# rdfind
PKG_VER=1.6.0
PKG_URL="https://rdfind.pauldreik.se/rdfind-${PKG_VER}.tar.gz"
PKG_DEPS=lfs/nettle
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
