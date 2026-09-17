# shellcheck shell=bash
# shellcheck disable=SC2154
# icu, target cross: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the recipe postbuild.sh. Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The cross build configuration the target build reads through --with-cross-build
cat >${TOOLCHAIN_PATH}/share/icu/${PKG_VER}/config/icucross.mk <<-EOF
	CROSS_ICU_VERSION=${PKG_VER}
	TOOLEXEEXT=
	TOOLBINDIR=${TOOLCHAIN_PATH}/bin
	TOOLLIBDIR=${TOOLCHAIN_PATH}/lib
	INVOKE=
	PKGDATA_INVOKE=
EOF
install -vm644 config/icucross.inc ${TOOLCHAIN_PATH}/share/icu/${PKG_VER}/config
