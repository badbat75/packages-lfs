# shellcheck shell=bash
# shellcheck disable=SC2154
# binutils: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	native)
		cd bfd
		make install-bfdincludeHEADERS
	;;
esac
