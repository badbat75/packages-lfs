# shellcheck shell=bash
# shellcheck disable=SC2154
# icu: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The cross build has its own (variants/target/cross/postbuild.sh).

### icu-config, Makefile.inc and pkgdata.inc give the compiler, the archiver and the flags to the
### builds against ICU and to pkgdata
strip_host_paths "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/icu-config" \
	"${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/icu/${PKG_VER}"/{Makefile,pkgdata}.inc
