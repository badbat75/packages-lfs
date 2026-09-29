# shellcheck shell=bash
# shellcheck disable=SC2154
# intltool, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The perl of the image in the programs, instead of the one of lfs/perl5:native that configure found
### (INTLTOOL_PERL)
{ grep -l "${GLOBAL_TOOLCHAIN_PATH}/perl5/bin/perl" "${PKG_PKGPATH}${INSTALL_EXECPREFIX}"/bin/* || true; } | \
	xargs -r sed -i "s#${GLOBAL_TOOLCHAIN_PATH}/perl5/bin/perl#${INSTALL_EXECPREFIX}/bin/perl#g"
grep -q "^#! *${INSTALL_EXECPREFIX}/bin/perl" "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/intltool-update"
[ -z "$(grep -l "${GLOBAL_TOOLCHAIN_PATH}/perl5" "${PKG_PKGPATH}${INSTALL_EXECPREFIX}"/bin/* || true)" ]
