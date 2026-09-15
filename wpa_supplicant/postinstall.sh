# shellcheck shell=bash
# shellcheck disable=SC2154
# wpa_supplicant: post-install script, sourced as root inside the target chroot.

# create netdev group if not already present
if ! getent group netdev > /dev/null; then
	groupadd --system netdev
fi
systemctl disable wpa_supplicant
