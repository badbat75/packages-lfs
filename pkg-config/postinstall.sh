# shellcheck shell=bash
# shellcheck disable=SC2154
# pkg-config: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

if [ -d ${INSTALL_PREFIX}/share/aclocal.2bmoved ]
then
    cp -fprv ${INSTALL_PREFIX}/share/aclocal.2bmoved/* ${INSTALL_PREFIX}/share/aclocal/
    rm -rfv ${INSTALL_PREFIX}/share/aclocal.2bmoved
fi
