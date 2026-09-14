# shellcheck shell=bash
# shellcheck disable=SC2154
# dejavu-fonts-ttf: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/{fonts/X11/ttf,fontconfig/conf.avail}
    install -vm644 ttf/* ${PKG_PKGPATH}${INSTALL_SHAREDIR}/fonts/X11/ttf
    install -vm644 fontconfig/* ${PKG_PKGPATH}${INSTALL_SHAREDIR}/fontconfig/conf.avail
