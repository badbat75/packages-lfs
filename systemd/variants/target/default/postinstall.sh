# shellcheck shell=bash
# shellcheck disable=SC2154
# systemd, the full build: post-install script, sourced as root inside the target chroot.

mkdir -pv ${INSTALL_LOCALSTATEDIR}/log/journal
journalctl --update-catalog

### The user and group databases of nsswitch.conf get the nss-systemd module, as nss-systemd(8)
### recommends: a service with DynamicUser=yes otherwise owns its files as a bare number and getent
### finds no name for it (measured: id in such a service printed uid=62957 with no name, and
### uid=61802(run-p1834-i4546) with the module). group merges, so both files and systemd answer.
### The hosts line is left alone: lfs/nss-mdns owns it, and the "resolve [!UNAVAIL=return]" the same
### page recommends would cut avahi out of it, because systemd-resolved answers NOTFOUND for the
### .local names it refuses (the ones of the other hosts of the LAN) and nothing after it runs.
for db in passwd shadow
do
	if ! grep -q "^${db}:.*systemd" ${INSTALL_SYSCONFDIR}/nsswitch.conf
	then
		sed -i "s/^\(${db}:.*\)\$/\1 systemd/" ${INSTALL_SYSCONFDIR}/nsswitch.conf
	fi
done
if ! grep -q '^group:.*systemd' ${INSTALL_SYSCONFDIR}/nsswitch.conf
then
	sed -i 's/^\(group:.*\)$/\1 [SUCCESS=merge] systemd/' ${INSTALL_SYSCONFDIR}/nsswitch.conf
fi
if ! grep -q '^gshadow:' ${INSTALL_SYSCONFDIR}/nsswitch.conf
then
	sed -i '/^shadow:/a gshadow: files systemd' ${INSTALL_SYSCONFDIR}/nsswitch.conf
fi
grep -e '^passwd:' -e '^group:' -e '^shadow:' -e '^gshadow:' ${INSTALL_SYSCONFDIR}/nsswitch.conf
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
