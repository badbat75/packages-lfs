# shellcheck shell=bash
# shellcheck disable=SC2154
# systemd, the full build: post-install script, sourced as root inside the target chroot.

mkdir -pv ${INSTALL_LOCALSTATEDIR}/log/journal
journalctl --update-catalog
# systemd-sysusers
# systemd-tmpfiles --create

### preset-all sets every unit to its preset: right while the image is made, where the packages
### that disable a unit run their postinstall later (hostapd, wpa_supplicant, the host key
### regeneration of raspberrypi-sys-mods). The sfx installer runs this script on a running
### system too, where preset-all would enable those units again and undo the choices of the
### administrator. A system without a machine id is being made, as for ConditionFirstBoot.
if [ ! -s ${INSTALL_SYSCONFDIR}/machine-id ]
then
	SYSTEMD_PRESET_ALL=1
fi
systemd-machine-id-setup
if [ -n "${SYSTEMD_PRESET_ALL}" ]
then
	systemctl preset-all
	systemctl --global preset-all
fi

systemd-hwdb update
/lib/systemd/systemd-random-seed save

### A board without a real time clock boots with the clock at the release date of systemd, its
### floor, until timesyncd reaches a server: days or weeks before the image ("account has password
### changed in future", timers elapsing at the jump). The mtime of /usr/lib/clock-epoch raises that
### floor to the time the image is made; timesyncd keeps its own after the first synchronisation.
touch ${INSTALL_PREFIX}/lib/clock-epoch
