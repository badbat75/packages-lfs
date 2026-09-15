# shellcheck shell=bash
# shellcheck disable=SC2154
# glibc, target stage1: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# The bootstrap headers need no configparms: only the build directory is created.

mkdir -pv ${PKG_BLDPATH}
