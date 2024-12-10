# libmpfr
PKG_VER=4.2.1
PKG_URL="http://www.mpfr.org/mpfr-${PKG_VER}/mpfr-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/libgmp"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--enable-thread-safe"
PKG_MAKETARGETS="all,install-strip"

case ${PKG_TARGET} in
	native)
		PKG_CHECK="[ \"$(PKG_CONFIG_LIBDIR=${INSTALL_LIBDIR}/pkgconfig pkg-config --modver mpfr 2>/dev/null || :)\" == \"${PKG_VER}\" ]"
	;;
	*)
		PKG_DEPS="lfs/ncurses lfs/readline"
	;;
esac