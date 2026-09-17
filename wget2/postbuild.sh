# shellcheck shell=bash
# shellcheck disable=SC2154
# wget2: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### wget2_noinstall is the test suite copy of wget2 (libtool -no-install: its run time path is the
### libwget directory of the build tree), which src/Makefile.am lists in bin_PROGRAMS all the same
rm -v "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/wget2_noinstall"
