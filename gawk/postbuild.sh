# shellcheck shell=bash
# shellcheck disable=SC2154
# gawk: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### gawkbug reports the compiler and the flags of the build
strip_host_paths "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/gawkbug"
