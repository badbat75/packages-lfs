# shellcheck shell=bash
# shellcheck disable=SC2154
# cracklib-words: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

touch ${INSTALL_SHAREDIR}/dict/cracklib-extra-words
LFS_HOSTNAME="$(cat ${INSTALL_SYSCONFDIR}/hostname 2>/dev/null)"
if [ ! -z ${LFS_HOSTNAME} ] && ! grep -q ${LFS_HOSTNAME} ${INSTALL_SHAREDIR}/dict/cracklib-extra-words; then
	echo ${LFS_HOSTNAME} >> ${INSTALL_SHAREDIR}/dict/cracklib-extra-words
fi
create-cracklib-dict ${INSTALL_SHAREDIR}/dict/cracklib-words ${INSTALL_SHAREDIR}/dict/cracklib-extra-words
