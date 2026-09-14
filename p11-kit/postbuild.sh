# shellcheck shell=bash
# shellcheck disable=SC2154
# p11-kit: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	bootstrap) ;;
	*)
		ln -sfv /usr/libexec/p11-kit/trust-extract-compat ${PKG_PKGPATH}/usr/bin/update-ca-certificates
	;;
esac
