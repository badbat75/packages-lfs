# shellcheck shell=bash
# shellcheck disable=SC2154
# pcsc-lite:server: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### What lfs/pcsc-lite:lib installs goes
split_install --drop "${PCSC_LIB_FILES}"
