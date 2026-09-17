# shellcheck shell=bash
# shellcheck disable=SC2154
# xorg-sgml-doc-tools: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).

### sgmlrootdir holds the entities and style sheets the documentation of the X.Org packages reads at
### build time: it points into the sysroot through ${pc_sysrootdir}, which pkgconf keeps under the FDO
### sysroot rules of target builds (/ in the image)
# shellcheck disable=SC2016
sed 's/^sgmlrootdir=/sgmlrootdir=${pc_sysrootdir}/' -i "${PKG_PKGPATH}${INSTALL_SHAREDIR}/pkgconfig/xorg-sgml-doctools.pc"
