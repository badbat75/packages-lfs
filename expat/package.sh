# expat
PKG_VER=2.6.4
PKG_URL="https://github.com/libexpat/libexpat/releases/download/R_$(echo "${PKG_VER}" | sed 's/\./_/g')/expat-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/xmlto:native"
BUILD_PROCESS=configmake
CONF_FLAGS="--docdir=${INSTALL_SHAREDIR}/doc/expat-${PKG_VER}"
PKG_MAKETARGETS="all,install-strip"
PKG_CFLAGS="-Wno-pedantic"
