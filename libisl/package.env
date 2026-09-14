# libisl
PKG_VER=0.27
PKG_URL="https://libisl.sourceforge.io/isl-${PKG_VER}.tar.xz"
BUILD_PROCESS=configmake
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
PKG_AUTOCONF=1

case ${PKG_TARGET} in
	native)
		PKG_CHECK="[ \"$(PKG_CONFIG_LIBDIR=${INSTALL_LIBDIR}/pkgconfig pkg-config --modver isl 2>/dev/null || :)\" == \"${PKG_VER}\" ]"
	;;
	*)
		PKG_DEPS="lfs/ncurses lfs/readline"
	;;
esac

case ${TOOLCHAIN} in
	llvm) PKG_CFLAGS="-Wno-macro-redefined" ;;
esac