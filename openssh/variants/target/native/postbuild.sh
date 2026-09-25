# shellcheck shell=bash
# shellcheck disable=SC2154
# openssh, target native: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vm755 ssh-keygen ${INSTALL_EXECPREFIX}/bin/
install -vdm755 ${INSTALL_SHAREDIR}
echo ${PKG_VER} > ${INSTALL_SHAREDIR}/ssh-keygen.version
