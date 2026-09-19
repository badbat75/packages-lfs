# shellcheck shell=bash
# shellcheck disable=SC2154
# systemd, the full build: post-install script, sourced as root inside the target chroot.

mkdir -pv ${INSTALL_LOCALSTATEDIR}/log/journal
journalctl --update-catalog
# systemd-sysusers
# systemd-tmpfiles --create

systemd-machine-id-setup
systemctl preset-all
systemctl --global preset-all

systemd-hwdb update
/lib/systemd/systemd-random-seed save

### A board without a real time clock boots with the clock at the release date of systemd, its
### floor, until timesyncd reaches a server: days or weeks before the image ("account has password
### changed in future", timers elapsing at the jump). The mtime of /usr/lib/clock-epoch raises that
### floor to the time the image is made; timesyncd keeps its own after the first synchronisation.
touch ${INSTALL_PREFIX}/lib/clock-epoch
