# font-util
PKG_VER=1.4.0
PKG_URL="https://www.x.org/archive//individual/font/font-util-${PKG_VER}.tar.xz"
PKG_DEPS=
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"

PKG_POSTBUILD="install -v -d -m755 \${PKG_PKGPATH}${INSTALL_SHAREDIR}/fonts/X11/{OTF,TTF}
    ln -svfn X11/OTF \${PKG_PKGPATH}${INSTALL_SHAREDIR}/fonts/X11-OTF
    ln -svfn X11/TTF \${PKG_PKGPATH}${INSTALL_SHAREDIR}/fonts/X11-TTF
"