# libtool
PKG_VER=2.4.7
PKG_URL="https://ftp.gnu.org/gnu/libtool/libtool-${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
CONF_FLAGS=""
PKG_CFLAGS="-Wno-implicit-function-declaration"
PKG_MAKETARGETS="all,install-strip"
case ${PKG_TARGET} in
    cross);;
    *)
        PKG_POSTBUILD="mv -v \${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal \${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal.2bmoved"
        PKG_POSTINSTALL="if [ -d ${INSTALL_PREFIX}/share/aclocal.2bmoved ]
        then
            cp -fprv ${INSTALL_PREFIX}/share/aclocal.2bmoved/* ${INSTALL_PREFIX}/share/aclocal/
            rm -rfv ${INSTALL_PREFIX}/share/aclocal.2bmoved
        fi"
    ;;
esac