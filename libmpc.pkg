# libmpc
PKG_VER=1.3.1
PKG_URL="https://ftp.gnu.org/gnu/mpc/mpc-${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--docdir=/usr/share/doc/mpc-${PKG_VER}"
PKG_MAKETARGETS="all,install-strip"

case ${PKG_TARGET} in
	native)
		PKG_CHECK="[ \"$(PKG_CONFIG_LIBDIR=${INSTALL_LIBDIR}/pkgconfig pkg-config --modver mpc 2>/dev/null || :)\" == \"${PKG_VER}\" ]"
  ;;
	*)
		PKG_DEPS="lfs/ncurses lfs/readline"
	;;
esac

PKG_POSTBUILD="install -vdm755 \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig
	cat >\${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/mpc.pc <<-EOF
		prefix=${INSTALL_PREFIX}
		exec_prefix=${INSTALL_EXECPREFIX}
		includedir=${INSTALL_INCLUDEDIR}
		libdir=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}

		Name: GNU MPC
		Description: GNU Multiple Precision Complex floating-point library
		URL: https://www.multiprecision.org/mpc/
		Version: ${PKG_VER}
		Cflags: -I\${includedir}
		Libs: -L\${libdir} -lmpc
	EOF
	"