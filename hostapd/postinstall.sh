# shellcheck shell=bash
# shellcheck disable=SC2154
# hostapd: post-install script, sourced as root inside the target chroot.

systemctl disable hostapd.service
