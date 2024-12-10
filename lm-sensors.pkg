# lm-sensors
PKG_VER=3.6.0
PKG_URL="https://github.com/lm-sensors/lm-sensors/archive/V${PKG_VER//./-}/lm-sensors-${PKG_VER//./-}.tar.gz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/which lfs/dmi-decode"
BUILD_PROCESS=simplemake
PKG_MAKEVARS="CC=\"\${CC}\" EXLDFLAGS=\"\${LDFLAGS}\" LIBDIR=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} MANDIR=${INSTALL_SHAREDIR}/man INSTALL_PREFIX=${INSTALL_PREFIX}"
#PKG_MAKETARGETS="all,install"
PKG_LDFLAGS="-s"