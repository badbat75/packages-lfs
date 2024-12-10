# libdaemon
PKG_VER=0.14
PKG_URL="https://0pointer.de/lennart/projects/libdaemon/libdaemon-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/doxygen:native"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKEVARS="docdir=/usr/share/doc/libdaemon-${PKG_VER}"
PKG_MAKETARGETS="all,install-strip"

PKG_POSTBUILD="./runmake.sh -C doc doxygen
    install -v -m755 -d \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/libdaemon-${PKG_VER}/reference/html
    install -v -m644 doc/reference/html/* \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/libdaemon-0.14/reference/html
    #install -v -m644 doc/reference/man/man3/* \${PKG_PKGPATH}${INSTALL_SHAREDIR}/man/man3"