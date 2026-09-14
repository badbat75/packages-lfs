# shellcheck shell=bash
# shellcheck disable=SC2154
# libpng: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/libpng-${PKG_VER}
    install -vDm644 ${PKG_SRCPATH}/{README,libpng-manual.txt} ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/libpng-${PKG_VER}
