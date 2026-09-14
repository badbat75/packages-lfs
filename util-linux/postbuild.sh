# shellcheck shell=bash
# shellcheck disable=SC2154
# util-linux: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	cross)
		install -vdm755 ${TOOLCHAIN_PATH}/lib
		install -vm755 .libs/{libuuid.so,libblkid.so} ${TOOLCHAIN_PATH}/lib
	;;
esac
