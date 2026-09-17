# shellcheck shell=bash
# shellcheck disable=SC2154
# nspr: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### nspr-config --libs adds the link flags of the build
strip_host_paths "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/nspr-config"
