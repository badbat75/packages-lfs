# cpio
PKG_VER=2.15
PKG_URL="https://ftp.gnu.org/gnu/cpio/cpio-${PKG_VER}.tar.bz2"
PKG_DEPS="lfs/flex:native"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--enable-mt --with-rmt=${INSTALL_EXECPREFIX}/libexec/rmt"
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed -i '/The name/,+2 d' src/global.c"

PKG_POSTBUILD="install -vdm755 \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cpio-${PKG_VER}/html
    install -v -m644 doc/html/* \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cpio-${PKG_VER}/html &&
    install -v -m644 doc/cpio.{html,txt} \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cpio-${PKG_VER}"

case ${TOOLCHAIN} in
    llvm) PKG_CFLAGS="-Wno-incompatible-function-pointer-types -Wno-implicit-function-declaration" ;;
esac

if texi2dvi >/dev/null 2>&1
then
    PKG_MAKETARGETS+=",-C doc pdf,-C doc ps"
    PKG_POSTBUILD+=";install -v -m644 doc/cpio.{pdf,ps,dvi} \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cpio-${PKG_VER}"
fi