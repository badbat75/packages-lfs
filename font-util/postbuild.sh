# shellcheck shell=bash
# shellcheck disable=SC2154
# font-util: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -d -m755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/fonts/X11/{OTF,TTF}
    ln -svfn X11/OTF ${PKG_PKGPATH}${INSTALL_SHAREDIR}/fonts/X11-OTF
    ln -svfn X11/TTF ${PKG_PKGPATH}${INSTALL_SHAREDIR}/fonts/X11-TTF
