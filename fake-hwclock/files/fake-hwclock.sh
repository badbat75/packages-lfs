#!/bin/bash
# fake-hwclock: the load of the epoch saved at the last shutdown starts a boot without an RTC
# from the closest known past; the save keeps that epoch fresh (the hourly timer, and the
# ExecStop of fake-hwclock.service at the shutdown)
set -e
CLOCK_FILE=/var/lib/fake-hwclock/clock

case ${1} in
	load)
		if [ -r "${CLOCK_FILE}" ]
		then
			FAKE_HWCLOCK_SAVED=$(cat "${CLOCK_FILE}")
			case ${FAKE_HWCLOCK_SAVED} in
				''|*[!0-9]*)
					echo "Invalid epoch in ${CLOCK_FILE}: ${FAKE_HWCLOCK_SAVED}" >&2
					exit 1
				;;
			esac
			### The clock only moves forward: the floor the kernel booted at is older than the
			### saved epoch, but a save newer than the last shutdown must not move the clock back
			### under a timesyncd that already corrected it
			if [ "${FAKE_HWCLOCK_SAVED}" -gt "$(date +%s)" ]
			then
				date -s "@${FAKE_HWCLOCK_SAVED}"
			fi
		fi
	;;
	save)
		mkdir -p "$(dirname "${CLOCK_FILE}")"
		date +%s > "${CLOCK_FILE}"
	;;
	*)
		echo "Usage: ${0} load|save" >&2
		exit 2
	;;
esac
