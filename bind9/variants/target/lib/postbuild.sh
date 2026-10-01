# shellcheck shell=bash
# shellcheck disable=SC2154
# bind9:lib: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the libraries of the library directory stay (the plugins of named are in its bind/)
find "${PKG_PKGPATH}" ! -type d ! -path "${PKG_PKGPATH}${INSTALL_LIBDIR}/lib*.so" -exec rm -fv {} +
find "${PKG_PKGPATH}" ! -type d -path "${PKG_PKGPATH}${INSTALL_LIBDIR}/*/*" -exec rm -fv {} +
find "${PKG_PKGPATH}" -mindepth 1 -type d -empty -delete
