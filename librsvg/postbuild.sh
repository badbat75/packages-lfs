# shellcheck shell=bash
# shellcheck disable=SC2154
# librsvg: post-build script, sourced by runpostbuild.sh (cwd = PKG_BLDPATH, set -ex).

### The SVG loader went into gdk_pixbuf_moduledir of gdk-pixbuf-2.0.pc, a host path because pkgconf
### prepends the sysroot to it: it moves to the image path, then the empty host path tree goes (rmdir
### stops the build if anything else was installed there)
LOADER_LIBDIR="${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
mkdir -p "${PKG_PKGPATH}${LOADER_LIBDIR}"
mv "${PKG_PKGPATH}${PKG_CONFIG_SYSROOT_DIR}${LOADER_LIBDIR}/gdk-pixbuf-2.0" "${PKG_PKGPATH}${LOADER_LIBDIR}/"
SYSROOT_TOPDIR="${PKG_CONFIG_SYSROOT_DIR#/}"
find "${PKG_PKGPATH}/${SYSROOT_TOPDIR%%/*}" -depth -type d -exec rmdir {} +
