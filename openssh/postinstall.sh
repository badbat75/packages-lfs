# shellcheck shell=bash
# shellcheck disable=SC2154
# openssh: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install  -v -m700 -d /var/lib/sshd
if ! getent group sshd; then
	groupadd --system -g 50 sshd
fi
if ! getent passwd sshd; then
	useradd --system -c 'sshd PrivSep' -d /var/lib/sshd -g sshd -s /sbin/nologin -u 50 sshd
fi
