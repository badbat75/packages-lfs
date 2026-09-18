# shellcheck shell=bash
# shellcheck disable=SC2154
# dtc, target native: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# Only the programs stay in the global toolchain: the host compiler of every build searches its include
# directory before the ones a package passes, so libfdt.h replaced the copy the kernel builds
# scripts/dtc with, and fdtoverlay missed fdt_setprop (an inline of fdt_setprop_namelen in that copy)
rm -fv ${INSTALL_INCLUDEDIR}/fdt.h ${INSTALL_INCLUDEDIR}/libfdt.h ${INSTALL_INCLUDEDIR}/libfdt_env.h \
	${INSTALL_LIBDIR}/libfdt.a ${INSTALL_LIBDIR}/pkgconfig/libfdt.pc
