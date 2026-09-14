# duktape
PKG_VER=2.7.0
PKG_URL="https://duktape.org/duktape-${PKG_VER}.tar.xz"
BUILD_PROCESS=simplemake
PKG_MAKEVARS="-f Makefile.sharedlibrary LIBDIR=/lib${HARCH_LIB}${INSTALL_LIBSUFFIX} INSTALL_PREFIX=${INSTALL_PREFIX}"
#PKG_MAKETARGETS="all,install"
PKG_PREBUILD="sed -i 's/-Os //' Makefile.sharedlibrary"