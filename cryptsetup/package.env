# cryptsetup
PKG_VER=2.6.1
PKG_URL="https://www.kernel.org/pub/linux/utils/cryptsetup/v$(echo ${PKG_VER} | cut -d. -f1,2)/cryptsetup-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/json-c lfs/lvm2 lfs/popt"
PKG_DEPS+=" lfs/libpwquality"
PKG_DEPS+=" lfs/libssh"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--exec-prefix=/ --libdir=/lib${HARCH_LIB}${INSTALL_LIBSUFFIX} --enable-fips --enable-pwquality --enable-asciidoc"
CONF_VARS="systemduserunitdir=${INSTALL_PREFIX}/lib/systemd/user systemd_tmpfilesdir=${INSTALL_LIBDIR}/tmpfiles.d"
PKG_MAKETARGETS="all,install-strip"
