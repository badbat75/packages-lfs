# shellcheck shell=bash
# shellcheck disable=SC2154
# bind9:lib: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the libraries stay
split_install --keep "${BIND_LIB_FILES}"
