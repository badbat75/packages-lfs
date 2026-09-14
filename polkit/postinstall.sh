# shellcheck shell=bash
# shellcheck disable=SC2154
# polkit: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

if ! getent group polkitd; then
	groupadd --system -fg 27 polkitd
fi

if ! getent passwd polkitd; then
	useradd --system -c "PolicyKit Daemon Owner" -d ${INSTALL_SYSCONFDIR}/polkit-1 -u 27 -g polkitd -s /sbin/nologin polkitd
fi

chown -R polkitd:polkitd ${INSTALL_SHAREDIR}/polkit-1/rules.d
chown -R polkitd:polkitd ${INSTALL_SYSCONFDIR}/polkit-1/rules.d
