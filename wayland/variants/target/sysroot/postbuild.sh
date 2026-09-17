# shellcheck shell=bash
# shellcheck disable=SC2154
# wayland, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).

### wayland_scanner is the program the next builds run: it points into the sysroot through
### ${pc_sysrootdir}, which pkgconf keeps under the FDO sysroot rules of target builds (/ in the image)
# shellcheck disable=SC2016
sed -E 's/^wayland_scanner=\$\{bindir\}\//wayland_scanner=${pc_sysrootdir}${bindir}\//' \
	-i "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/wayland-scanner.pc"
