# shellcheck shell=bash
# shellcheck disable=SC2154
# mold, target cross: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### A cross gcc looks for -fuse-ld=mold as <HARCH>-ld.mold in the PATH (collect2), the name
### TOOLCHAIN_LINKER_EXE of a target build gives; clang and the native builds find ld.mold
ln -fsv mold ${INSTALL_EXECPREFIX}/bin/${HARCH}-ld.mold
