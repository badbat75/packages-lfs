# shellcheck shell=bash
# shellcheck disable=SC2154
# cracklib: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -m755 -d ${PKG_PKGPATH}${INSTALL_LIBDIR}/cracklib
### The python module (_cracklib) needs no libtool archive, whose dependency_libs name the gcc library
### directory of the toolchain
rm -fv "${PKG_PKGPATH}${INSTALL_EXECPREFIX}"/lib/python3*/site-packages/*.la
