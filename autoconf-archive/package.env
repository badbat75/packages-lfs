# autoconf-archive
PKG_SUFFIX=_${AUTOCONFARCHIVE_VER}
PKG_URL="http://mirror.kumi.systems/gnu/autoconf-archive/autoconf-archive-${AUTOCONFARCHIVE_VER}.tar.xz"
PKG_DEPS=
BUILD_PROCESS=configmake
CONF_FLAGS=""
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
