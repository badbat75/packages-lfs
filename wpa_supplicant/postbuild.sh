# shellcheck shell=bash
# shellcheck disable=SC2154
# wpa_supplicant: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

mkdir -pv ${PKG_PKGPATH}/sbin ${PKG_PKGPATH}/lib/systemd/system
install -d ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/wpa_supplicant
install -v -m755 -s --strip-program=${HARCH:+${HARCH}-}strip -D wpa_supplicant/{wpa_cli,wpa_passphrase,wpa_supplicant} ${PKG_PKGPATH}/sbin/
install -vdm755 ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/pm-utils/sleep.d
install -v -m644 -D wpa_supplicant/examples/60_wpa_supplicant ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/pm-utils/sleep.d/
install -v -m644 -D wpa_supplicant/systemd/*.service ${PKG_PKGPATH}/lib/systemd/system/
### DBus Configuration
install -vdm755 ${PKG_PKGPATH}${INSTALL_PREFIX}/share/dbus-1/system-services
install -v -m644 -D wpa_supplicant/dbus/fi.*.service ${PKG_PKGPATH}${INSTALL_PREFIX}/share/dbus-1/system-services/
install -vdm755 ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/dbus-1/system.d
install -v -m644 -D wpa_supplicant/dbus/dbus-wpa_supplicant.conf ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/dbus-1/system.d/wpa_supplicant.conf
