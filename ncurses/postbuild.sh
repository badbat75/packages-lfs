# shellcheck shell=bash
# shellcheck disable=SC2154
# ncurses: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

echo "INPUT(-lncursesw)" > ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libncurses.so
	echo "INPUT(-lncursesw)" > ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libtinfo.so
	sed -e 's/^Libs: .*-l/Libs: -L\${libdir} -l/' -e 's/^Cflags:  -D/Cflags: -I\${includedir} -D/' -i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/{formw,menuw,ncursesw,panelw}.pc
