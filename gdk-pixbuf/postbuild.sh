# shellcheck shell=bash
# shellcheck disable=SC2154
# gdk-pixbuf: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).

### The pc variables naming a program (gdk-pixbuf-query-loaders, gdk-pixbuf-pixdata...) point into the
### sysroot through ${pc_sysrootdir}, which pkgconf keeps under the FDO sysroot rules of target builds
### (/ in the image)
# shellcheck disable=SC2016
sed -E 's/^([a-z_]+)=\$\{bindir\}\//\1=${pc_sysrootdir}${bindir}\//' \
	-i "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/gdk-pixbuf-2.0.pc"
