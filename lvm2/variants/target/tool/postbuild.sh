# shellcheck shell=bash
# shellcheck disable=SC2154
# lvm2:tool: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# shellcheck source=/dev/null
source "${PKG_RECIPEPATH}/postbuild.sh"
### What lfs/lvm2:lib installs goes
split_install --drop "${LVM2_LIB_FILES}"
