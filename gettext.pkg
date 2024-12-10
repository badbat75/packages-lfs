# gettext
PKG_VER=0.22.5
PKG_URL="https://ftp.gnu.org/pub/gnu/gettext/gettext-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/expat lfs/autoconf:cross lfs/automake:cross lfs/libtool:cross"
BUILD_PROCESS=configmake
CONF_FLAGS="--without-git --without-cvs --docdir=/usr/share/doc/gettext-${PKG_VER}"
PKG_MAKETARGETS="all DESTDIR=,install-strip"
PKG_PREBUILD="autoreconf -fi"
PKG_CFLAGS="-Wno-incompatible-pointer-types"

case ${PKG_TARGET} in
	cross)
        CONF_FLAGS+=" --with-libiconv-prefix=/usr"
    ;;
    *) 
        PKG_DEPS+=" lfs/ncurses lfs/libxml2 lfs/GLib lfs/libunistring"
        PKG_POSTBUILD="mv -v \${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal \${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal.2bmoved"
        PKG_POSTINSTALL="if [ -d ${INSTALL_PREFIX}/share/aclocal.2bmoved ]
        then
            cp -fprv ${INSTALL_PREFIX}/share/aclocal.2bmoved/* ${INSTALL_PREFIX}/share/aclocal/
            rm -rfv ${INSTALL_PREFIX}/share/aclocal.2bmoved
        fi"
    ;;
esac