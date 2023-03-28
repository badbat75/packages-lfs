# pciutils
PKG_VER=3.9.0
PKG_URL="https://mirrors.edge.kernel.org/pub/software/utils/pciutils/pciutils-${PKG_VER}.tar.xz"
BUILD_PROCESS=simplemake
PKG_CFLAGS=""
PKG_MAKETARGETS="all,install"
PKG_MAKEVARS="LIBDIR=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} STRIP=\"-s --strip-program=\${STRIP}\" CROSS_COMPILE=${HARCH}- HOST=${HARCH} SHARED=yes ZLIB=no"

PKG_PREBUILD="sed 's/^CFLAGS=/CFLAGS?=/;s/^CC=/CC?=/;s/^AR=/AR?=/;s/^RANLIB=/RANLIB?=/' -i Makefile"
