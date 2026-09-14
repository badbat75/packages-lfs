# shellcheck shell=bash
# shellcheck disable=SC2154
# tzdata: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

ZONEINFO=${PKG_PKGPATH}/usr/share/zoneinfo
		mkdir -pv $ZONEINFO/{posix,right}

		for tz in etcetera southamerica northamerica europe africa antarctica  \
				asia australasia backward; do
			zic -L /dev/null   -d $ZONEINFO       ${tz}
			zic -L /dev/null   -d $ZONEINFO/posix ${tz}
			zic -L leapseconds -d $ZONEINFO/right ${tz}
		done

		cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
		zic -d $ZONEINFO -p America/New_York
		unset ZONEINFO
		mkdir -pv ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}
		ln -sfv /usr/share/zoneinfo/Europe/Rome ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/localtime
