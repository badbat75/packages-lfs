# libaio
PKG_VER=0.3.113
PKG_URL="https://pagure.io/libaio/archive/libaio-${PKG_VER}/libaio-${PKG_VER}.tar.gz"
BUILD_PROCESS=simplemake
PKG_MAKEVARS="libdir=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
#PKG_MAKETARGETS="all,install"
PKG_OVERRIDELTO=0

PKG_PREBUILD="sed 's/-Werror//' -i harness/Makefile"

PKG_POSTBUILD="\${STRIP} --strip-unneeded \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libaio.so"