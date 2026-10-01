# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target lldb: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the postbuild.sh of target/sysroot, which makes the LLVMConfig.cmake of the sysroot: lldb
# installs none. Nothing to do after the install
:
