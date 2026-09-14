# shellcheck shell=bash
# shellcheck disable=SC2154
# bluez: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_PREFIX}/sbin/
	ln -svf ../libexec/bluetooth/bluetoothd ${PKG_PKGPATH}${INSTALL_PREFIX}/sbin/
	install -vdm755 ${PKG_PKGPATH}/etc/bluetooth/
	install -vm644 ${PKG_SRCPATH}/{src/main.conf,profiles/input/input.conf,profiles/network/network.conf} ${PKG_PKGPATH}/etc/bluetooth/
