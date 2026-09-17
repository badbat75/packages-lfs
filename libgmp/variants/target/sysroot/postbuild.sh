# shellcheck shell=bash
# shellcheck disable=SC2154
# libgmp, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### gmp.h defines __GMP_CC and __GMP_CFLAGS, the compiler and the flags of the build
strip_host_paths "${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/gmp.h"
