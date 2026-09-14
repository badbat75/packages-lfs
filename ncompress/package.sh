# ncompress
PKG_VER=5.0
PKG_URL="https://github.com/vapier/ncompress/archive/refs/tags/v${PKG_VER}.tar.gz"
BUILD_PROCESS=simplemake
PKG_MAKEVARS="LIBDIR=/lib${HARCH_LIB}${INSTALL_LIBSUFFIX} INSTALL_PREFIX=${INSTALL_PREFIX}"
PKG_MAKETARGETS=",install"
PKG_LDFLAGS="-s"