# shellcheck shell=bash
# shellcheck disable=SC2154
# automake, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

mv -v ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal.2bmoved
### The perl of the image in the programs (aclocal, automake), instead of the one of lfs/perl5:native
### that configure found
{ grep -l "${GLOBAL_TOOLCHAIN_PATH}/perl5/bin/perl" "${PKG_PKGPATH}${INSTALL_EXECPREFIX}"/bin/* || true; } | \
	xargs -r sed -i "s#${GLOBAL_TOOLCHAIN_PATH}/perl5/bin/perl#${INSTALL_EXECPREFIX}/bin/perl#g"
[ -z "$(grep -l "${GLOBAL_TOOLCHAIN_PATH}/perl5" "${PKG_PKGPATH}${INSTALL_EXECPREFIX}"/bin/* || true)" ]
