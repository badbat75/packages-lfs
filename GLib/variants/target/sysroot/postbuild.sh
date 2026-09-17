# shellcheck shell=bash
# shellcheck disable=SC2154
# GLib, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).

### The pc variables naming a program (glib-mkenums, glib-compile-resources, gdbus-codegen...) and
### girdir are what the meson gnome module of the next builds runs and reads: they point into the
### sysroot through ${pc_sysrootdir}, which pkgconf keeps under the FDO sysroot rules of target
### builds. In the image ${pc_sysrootdir} is /
# shellcheck disable=SC2016
sed -E -e 's/^([a-z_]+)=\$\{bindir\}\//\1=${pc_sysrootdir}${bindir}\//' \
	-e 's/^girdir=/girdir=${pc_sysrootdir}/' \
	-i "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"/pkgconfig/*.pc
