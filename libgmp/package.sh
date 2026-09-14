# libgmp
PKG_VER=6.3.0
PKG_URL="http://ftp.gnu.org/gnu/gmp/gmp-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native"
BUILD_PROCESS=configmake
CONF_FLAGS="--enable-cxx"
PKG_MAKETARGETS="all,install-strip"
PKG_AUTOCONF=1
PKG_OVERRIDELTO=0

PKG_PREBUILD="cp -v configfsf.guess config.guess
  cp -v configfsf.sub   config.sub"

case ${PKG_TARGET} in
	native)
		PKG_CHECK="[ \"$(PKG_CONFIG_LIBDIR=${INSTALL_LIBDIR}/pkgconfig pkg-config --modver gmp 2>/dev/null || :)\" == \"${PKG_VER}\" ]"
  ;;
  *)
    PKG_DEPS+=" lfs/ncurses lfs/readline"
  ;;
esac