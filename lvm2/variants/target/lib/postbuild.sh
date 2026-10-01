# shellcheck shell=bash
# shellcheck disable=SC2154
# lvm2:lib: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only device-mapper stays (lvm.conf, which the recipe script edits, goes with LVM)
split_install --keep "${LVM2_LIB_FILES}"
