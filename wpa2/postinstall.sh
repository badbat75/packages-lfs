# shellcheck shell=bash
# shellcheck disable=SC2154
# wpa2: post-install script, sourced as root inside the target chroot.

case ${PKG_TARGET} in
	wpa_supplicant)
		# create netdev group if not already present
		if ! getent group netdev > /dev/null; then
			groupadd --system netdev
		fi
		systemctl disable wpa_supplicant
	;;
	hostapd)
		systemctl disable hostapd.service
	;;
esac
