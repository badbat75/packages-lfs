# shellcheck shell=bash
# shellcheck disable=SC2154
# pkgconf: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	native)
		ln -fsv pkgconf ${INSTALL_EXECPREFIX}/bin/pkg-config
	;;
	cross)
		ln -fsv ${HARCH}-pkgconf ${INSTALL_EXECPREFIX}/bin/${HARCH}-pkg-config
	;;
	*)
		ln -fsv pkgconf ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/pkg-config
		mv -v ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal.2bmoved
	;;
esac
