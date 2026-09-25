# shellcheck shell=bash
# shellcheck disable=SC2154
# shadow, target native: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The two programs osconfig.functions runs, not the whole suite (no setuid program in the toolchain)
install -vm755 src/useradd src/chpasswd ${INSTALL_EXECPREFIX}/bin/
install -vdm755 ${INSTALL_SHAREDIR}
echo ${PKG_VER} > ${INSTALL_SHAREDIR}/shadow.version
