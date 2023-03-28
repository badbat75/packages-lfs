# wireless-tools
PKG_VER=29
PKG_URL="https://hewlettpackard.github.io/wireless-tools/wireless_tools.${PKG_VER}.tar.gz"
case ${PKG_VER} in
    29) PATCHES="http://www.linuxfromscratch.org/patches/blfs/svn/wireless_tools-29-fix_iwlist_scanning-1.patch";;
esac
BUILD_PROCESS=simplemake
#PKG_MAKETARGETS="all,install"
PKG_DEPS="lfs/libnl"
PKG_MAKEVARS="CFLAGS=\"\${CFLAGS}\" LIBS=\"\${LDFLAGS} -lm\" BUILD_STRIPPING=1 PREFIX=\${PKG_PKGPATH}${INSTALL_PREFIX}"
PKG_PREBUILD="sed -i -e 's/^CC =/CC ?=/' -e 's/^AR =/AR ?=/' -e 's/^RANLIB =/RANLIB ?=/' Makefile
    sed -i '/^INSTALL_LIB=/ s|/lib/$|/lib${HARCH_LIB}${INSTALL_LIBSUFFIX}/|' Makefile"