# pkg-config
PKG_VER=0.29.2
PKG_URL="https://pkgconfig.freedesktop.org/releases/pkg-config-${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
CONF_FLAGS="--with-pc-path=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig:${INSTALL_PREFIX}/share \
    --with-system-include-path=${INSTALL_INCLUDEDIR} \
    --with-system-library-path=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
PKG_MAKETARGETS="all,install-strip"
PKG_POSTBUILD="mv -v \${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal \${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal.2bmoved"
PKG_POSTINSTALL="if [ -d ${INSTALL_PREFIX}/share/aclocal.2bmoved ]
then
    cp -fprv ${INSTALL_PREFIX}/share/aclocal.2bmoved/* ${INSTALL_PREFIX}/share/aclocal/
    rm -rfv ${INSTALL_PREFIX}/share/aclocal.2bmoved
fi"