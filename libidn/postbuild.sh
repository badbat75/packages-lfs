# shellcheck shell=bash
# shellcheck disable=SC2154
# libidn: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

find doc -name Makefile* -delete
    rm -rf -v doc/{gdoc,idn.1,stamp-vti,man,texi}
    install -vdm755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/libidn-${PKG_VER}
    cp -r -v doc/* ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/libidn-${PKG_VER}
