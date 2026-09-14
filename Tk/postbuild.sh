# shellcheck shell=bash
# shellcheck disable=SC2154
# Tk: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e "s@${PKG_BLDPATH}/unix@${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}@g" -i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/tkConfig.sh
	ln -v -sf wish8.6 ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/wish &&
	chmod -v 755 ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libtk8.6.so
