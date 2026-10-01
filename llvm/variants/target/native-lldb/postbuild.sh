# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target native-lldb: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the postbuild.sh of target/native, which completes the install of the LLVM itself.

### lldb-tblgen, the tablegen the cross build of lldb (lfs/llvm:lldb) runs, is not installed
install -vm755 bin/lldb-tblgen "${INSTALL_EXECPREFIX}/bin/"
