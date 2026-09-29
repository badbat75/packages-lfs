#!/bin/sh
# dracut-hostonly: the initramfs of every kernel of /boot made again for this machine (lfs/lfs-utils)
### The kernel package installs a generic initramfs, made on the build host for any machine of the
### platform; here it is kept as initramfs-<release>-generic.img, the rescue entry of the boot
### loader, and replaced by one with only what this machine needs (dracut --hostonly). The stamp in
### /var/lib/dracut-hostonly is the size and the mtime of the initramfs made last time: another file
### is a generic one a kernel package installed since, which is done again. Run it as root after the
### first boot and after every kernel package installed: /opt/lfs-utils/dracut-hostonly.sh
set -e
STATE=/var/lib/dracut-hostonly
mkdir -p "${STATE}"
for MODDIR in /lib/modules/*/
do
	RELEASE=$(basename "${MODDIR}")
	INITRAMFS=/boot/initramfs-${RELEASE}.img
	[ -f "${INITRAMFS}" ] || continue
	[ "$(stat -c '%s %Y' "${INITRAMFS}")" = "$(cat "${STATE}/${RELEASE}" 2>/dev/null)" ] && continue
	echo "initramfs of ${RELEASE}: the generic one to initramfs-${RELEASE}-generic.img, a new one for this machine"
	cp -f "${INITRAMFS}" "/boot/initramfs-${RELEASE}-generic.img"
	### Written aside and renamed: a power loss in the middle leaves the generic one in place
	dracut --hostonly --force "${INITRAMFS}.new" "${RELEASE}"
	mv -f "${INITRAMFS}.new" "${INITRAMFS}"
	sync
	stat -c '%s %Y' "${INITRAMFS}" > "${STATE}/${RELEASE}"
done
