# shellcheck shell=bash
# shellcheck disable=SC2154
# binutils, target native: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the postbuild.sh of the recipe. The headers of bfd (plugin-api.h for LLVMgold.so)
cd bfd
make install-bfdincludeHEADERS
