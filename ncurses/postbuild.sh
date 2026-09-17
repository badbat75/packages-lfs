# shellcheck shell=bash
# shellcheck disable=SC2154
# ncurses: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The cross build has its own (variants/target/cross/postbuild.sh).

echo "INPUT(-lncursesw)" > ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libncurses.so
	echo "INPUT(-lncursesw)" > ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libtinfo.so
	sed -e 's/^Libs: .*-l/Libs: -L\${libdir} -l/' -e 's/^Cflags:  -D/Cflags: -I\${includedir} -D/' -i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/{formw,menuw,ncursesw,panelw}.pc
### ncursesw6-config gives the link flags of the build; curses.h and terminfo(5) name the Caps files
### of the source tree they were generated from
strip_host_paths "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/ncursesw${PKG_VER%%.*}-config"
sed -i "s@${PKG_SRCPATH}/@@g" "${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/curses.h" \
	"${PKG_PKGPATH}${INSTALL_SHAREDIR}/man/man5/terminfo.5"
