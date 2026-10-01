# shellcheck shell=bash
# shellcheck disable=SC2154
# ncurses, target cross or native: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the recipe postbuild.sh. Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The toolchain keeps the paths of the build: the link scripts and the pc files only.

echo "INPUT(-lncursesw)" > ${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libncurses.so
echo "INPUT(-lncursesw)" > ${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libtinfo.so
### form, panel and menu by their plain names too (the panel the curses GUI of lldb looks for)
for LIB in form panel menu
do
	echo "INPUT(-l${LIB}w)" > ${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/lib${LIB}.so
done
sed -e 's/^Libs: .*-l/Libs: -L\${libdir} -l/' -e 's/^Cflags:  -D/Cflags: -I\${includedir} -D/' -i ${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/{formw,menuw,ncursesw,panelw}.pc
