# dejavu-fonts-ttf
PKG_VER=2.37
PKG_URL="https://sourceforge.net/projects/dejavu/files/dejavu/${PKG_VER}/dejavu-fonts-ttf-${PKG_VER}.tar.bz2/download"
BUILD_PROCESS=downloadonly

PKG_PREBUILD="install -vdm755 \${PKG_PKGPATH}${INSTALL_SHAREDIR}/{fonts/X11/ttf,fontconfig/conf.avail}
    install -vm644 ttf/* \${PKG_PKGPATH}${INSTALL_SHAREDIR}/fonts/X11/ttf
    install -vm644 fontconfig/* \${PKG_PKGPATH}${INSTALL_SHAREDIR}/fontconfig/conf.avail"