# automake
PKG_VER=1.16.5
PKG_URL="https://ftp.gnu.org/gnu/automake/automake-${PKG_VER}.tar.xz"
BUILD_PROCESS=configmake
PKG_PREBUILD="./bootstrap"
CONF_FLAGS="--docdir=/usr/share/doc/automake-${PKG_VER}"
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