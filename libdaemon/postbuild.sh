# shellcheck shell=bash
# shellcheck disable=SC2154
# libdaemon: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

./runmake.sh -C doc doxygen
    install -v -m755 -d ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/libdaemon-${PKG_VER}/reference/html
    install -v -m644 doc/reference/html/* ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/libdaemon-0.14/reference/html
    #install -v -m644 doc/reference/man/man3/* ${PKG_PKGPATH}${INSTALL_SHAREDIR}/man/man3
