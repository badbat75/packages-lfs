# shellcheck shell=bash
# shellcheck disable=SC2154
# autoconf-archive: post-install script, sourced as root inside the target chroot.

if [ -d ${INSTALL_PREFIX}/share/aclocal.2bmoved ]
then
	cp -fprv ${INSTALL_PREFIX}/share/aclocal.2bmoved/* ${INSTALL_PREFIX}/share/aclocal/
	rm -rfv ${INSTALL_PREFIX}/share/aclocal.2bmoved
fi
