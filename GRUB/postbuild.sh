# shellcheck shell=bash
# shellcheck disable=SC2154
# GRUB: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/bash-completion/completions
    mv -v ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/bash_completion.d/grub ${PKG_PKGPATH}${INSTALL_SHAREDIR}/bash-completion/completions
