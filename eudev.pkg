# eudev
PKG_VER=3.2.14
PKG_URL="https://github.com/eudev-project/eudev/releases/download/v${PKG_VER}/eudev-${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"

PKG_POSTBUILD="mkdir -pv \${PKG_PKGPATH}${INSTALL_LIBDIR}/systemd
    ln -s ../../sbin/udevd \${PKG_PKGPATH}/usr/lib/systemd/systemd-udevd"
