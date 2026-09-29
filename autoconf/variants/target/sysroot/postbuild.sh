# shellcheck shell=bash
# shellcheck disable=SC2154
# autoconf, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The m4 of the image in the programs that name it (autom4te, autoupdate), instead of the one of
### lfs/m4:native the build ran
grep -l "'${GLOBAL_TOOLCHAIN_PATH}/bin/m4'" "${PKG_PKGPATH}${INSTALL_EXECPREFIX}"/bin/* | \
	xargs -r sed -i "s#'${GLOBAL_TOOLCHAIN_PATH}/bin/m4'#'${INSTALL_EXECPREFIX}/bin/m4'#"
grep -q "'${INSTALL_EXECPREFIX}/bin/m4'" "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/autom4te"
! grep -l "${GLOBAL_TOOLCHAIN_PATH}/bin/m4" "${PKG_PKGPATH}${INSTALL_EXECPREFIX}"/bin/*
