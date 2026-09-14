# shellcheck shell=bash
# shellcheck disable=SC2154
# libmpc: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig
	cat >${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/mpc.pc <<-EOF
		prefix=${INSTALL_PREFIX}
		exec_prefix=${INSTALL_EXECPREFIX}
		includedir=${INSTALL_INCLUDEDIR}
		libdir=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}

		Name: GNU MPC
		Description: GNU Multiple Precision Complex floating-point library
		URL: https://www.multiprecision.org/mpc/
		Version: ${PKG_VER}
		Cflags: -I${includedir}
		Libs: -L${libdir} -lmpc
	EOF
