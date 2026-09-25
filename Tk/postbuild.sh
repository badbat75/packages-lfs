# shellcheck shell=bash
# shellcheck disable=SC2154
# Tk: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The build tree is libdir in the image, the source tree (TK_SRC_DIR, for the private headers) includedir
sed -e "s@${PKG_BLDPATH}/unix@${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}@g" -e "s@${PKG_SRCPATH}@${INSTALL_INCLUDEDIR}@g" \
	-i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/tkConfig.sh
### configure runs pkg-config by name for Xft, the native one that keeps the -L of the sysroot: TK_LIBS
### and Libs.private carry it
strip_host_paths "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"/{tkConfig.sh,pkgconfig/tk.pc}
### Tk 9 names its library after the Tcl it is built for: libtcl9tk9.0.so
ln -v -sf wish${PKG_VER%.*} ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/wish
chmod -v 755 ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libtcl${PKG_VER%%.*}tk${PKG_VER%.*}.so
