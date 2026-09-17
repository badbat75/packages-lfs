# shellcheck shell=bash
# shellcheck disable=SC2154
# pkgconf: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The native and cross builds have their own (variants/target/<target>/postbuild.sh).

ln -fsv pkgconf ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/pkg-config
mv -v ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal.2bmoved
