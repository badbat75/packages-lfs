# shellcheck shell=bash
# shellcheck disable=SC2154
# gettext, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the recipe postbuild.sh. Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The sample projects of gettext-tools (11 MB of docdir): configure has no switch for them
rm -rf ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/gettext-${PKG_VER}/examples
### The macros join the aclocal directory of the image in postinstall.sh
mv -v ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal ${PKG_PKGPATH}${INSTALL_PREFIX}/share/aclocal.2bmoved
