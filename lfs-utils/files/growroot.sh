#!/bin/sh
# growroot.sh [-n]: the partition of / grown to the end of its disk, then its file system (lfs/lfs-utils)
### For an image written on a card or a disk larger than the image. The partition has to be the last
### one of the disk; a GPT gets its backup header moved to the new end first. The partition table is
### changed while / is mounted and the kernel is told the new size of the partition (partx -u), then
### the file system grows online: ext2/3/4 with resize2fs, btrfs and xfs through their mount point;
### f2fs grows only unmounted. -n shows what sfdisk would do and changes nothing
set -e
DRYRUN=
[ "${1}" = "-n" ] && DRYRUN=--no-act
[ "$(id -u)" -eq 0 ] || { echo "growroot: run it as root" >&2; exit 1; }

### The device of / without the [/subvolume] of btrfs, through the symbolic links of /dev/disk
PART=$(readlink -f "$(findmnt -n -v -o SOURCE /)")
FSTYPE=$(findmnt -n -o FSTYPE /)
NAME=$(basename "${PART}")
[ -f "/sys/class/block/${NAME}/partition" ] || { echo "growroot: / is on ${PART}, not a partition of a disk" >&2; exit 1; }
NUM=$(cat "/sys/class/block/${NAME}/partition")
DISK=/dev/$(lsblk -n -d -o PKNAME "${PART}")
LAST=$(partx -g -o START,NR "${DISK}" | sort -n | tail -n 1 | awk '{print $2}')
[ "${LAST}" = "${NUM}" ] || { echo "growroot: ${PART} is not the last partition of ${DISK} (${LAST} is)" >&2; exit 1; }

echo "growroot: ${PART} (${FSTYPE}), partition ${NUM} of ${DISK}: $(lsblk -n -d -b -o SIZE "${PART}") of $(lsblk -n -d -b -o SIZE "${DISK}") bytes"
if [ "$(lsblk -n -d -o PTTYPE "${DISK}")" = gpt ]
then
	sfdisk ${DRYRUN} --relocate gpt-bak-std "${DISK}"
fi
echo ", +" | sfdisk ${DRYRUN} --no-reread --no-tell-kernel -N "${NUM}" "${DISK}"
[ -n "${DRYRUN}" ] && exit 0
partx -u -n "${NUM}" "${DISK}"

case ${FSTYPE} in
	ext2|ext3|ext4) resize2fs "${PART}" ;;
	btrfs) btrfs filesystem resize max / ;;
	xfs) xfs_growfs / ;;
	*) echo "growroot: the partition is grown, the ${FSTYPE} file system on it is not (it grows only unmounted, or not at all)" >&2; exit 1 ;;
esac
echo "growroot: ${PART} is $(lsblk -n -d -b -o SIZE "${PART}") bytes, / has $(df -h --output=size / | tail -n 1 | tr -d ' ') now"
