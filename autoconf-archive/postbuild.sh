# shellcheck shell=bash
# shellcheck disable=SC2154
# autoconf-archive: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	cross) ;;
	*)
		mv -v ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal.2bmoved
	;;
esac
