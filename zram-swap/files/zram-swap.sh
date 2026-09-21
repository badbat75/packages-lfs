#!/bin/bash
# zram-swap: formats /dev/zram0 as a compressed swap device sized as a percentage of the RAM,
# and swaps it on at the priority of /etc/default/zram-swap. The stop of the unit swaps it off
# and resets the device, so a restart starts from a clean one.
set -e
ZRAM_DEV=/dev/zram0
ZRAM_SYS=/sys/class/block/zram0

. /etc/default/zram-swap

case ${1} in
	start)
		modprobe zram num_devices=1
		if [ -n "${ZRAM_DEVSIZE:-}" ]
		then
			ZRAM_SIZE=${ZRAM_DEVSIZE}
		else
			ZRAM_SIZE=$(( $(awk '/^MemTotal:/ {print $2}' /proc/meminfo) * 1024 * ${ZRAM_SIZE_PERCENT} / 100 ))
		fi
		if [ -n "${ZRAM_ALGO:-}" ]
		then
			echo "${ZRAM_ALGO}" > "${ZRAM_SYS}/comp_algorithm" 2> /dev/null || true
		fi
		echo "${ZRAM_SIZE}" > "${ZRAM_SYS}/disksize"
		mkswap "${ZRAM_DEV}"
		swapon -p "${ZRAM_PRIORITY}" "${ZRAM_DEV}"
	;;
	stop)
		swapoff "${ZRAM_DEV}" 2> /dev/null || true
		echo 1 > "${ZRAM_SYS}/reset"
	;;
	*)
		echo "Usage: ${0} start|stop" >&2
		exit 2
	;;
esac
