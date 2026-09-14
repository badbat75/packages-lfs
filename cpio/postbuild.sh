# shellcheck shell=bash
# shellcheck disable=SC2154
# cpio: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cpio-${PKG_VER}/html
    install -v -m644 doc/html/* ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cpio-${PKG_VER}/html &&
    install -v -m644 doc/cpio.{html,txt} ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cpio-${PKG_VER}
if texi2dvi >/dev/null 2>&1
then
	install -v -m644 doc/cpio.{pdf,ps,dvi} ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cpio-${PKG_VER}
fi
