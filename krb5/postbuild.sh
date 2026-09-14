# shellcheck shell=bash
# shellcheck disable=SC2154
# krb5: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	bootstrap) ;;
	*)
		install -v -dm755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/krb5-${PKG_VER} &&
		cp -vfr ${PKG_SRCPATH}/doc/*  ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/krb5-${PKG_VER}
	;;
esac
