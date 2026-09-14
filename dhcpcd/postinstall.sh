# shellcheck shell=bash
# shellcheck disable=SC2154
# dhcpcd: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

if ! getent group dhcpcd; then
	groupadd --system -g 52 dhcpcd
fi
if ! getent passwd dhcpcd; then
	useradd --system -c "DHCP Client Daemon" -d /var/lib/dhcpcd -g dhcpcd -s /sbin/nologin -u 52 dhcpcd
fi
chown -v dhcpcd:dhcpcd /var/lib/dhcpcd
