# shellcheck shell=bash
# shellcheck disable=SC2154
# libpcap: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

mv -v ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/pkgconfig ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
