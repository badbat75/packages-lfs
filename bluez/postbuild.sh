# shellcheck shell=bash
# shellcheck disable=SC2154
# bluez: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_PREFIX}/sbin/
	ln -svf ../libexec/bluetooth/bluetoothd ${PKG_PKGPATH}${INSTALL_PREFIX}/sbin/
	install -vdm755 ${PKG_PKGPATH}/etc/bluetooth/
	install -vm644 ${PKG_SRCPATH}/{src/main.conf,profiles/input/input.conf,profiles/network/network.conf} ${PKG_PKGPATH}/etc/bluetooth/
### preset-all in the systemd postinstall enables every unit no preset names. bluetooth-meshd wants
### the controller for itself and found it taken by bluetoothd ("Controller hci 0 already in use"):
### a mesh node is set up on purpose, not by default
install -vdm755 ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/systemd/system-preset
echo "disable bluetooth-mesh.service" > ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/systemd/system-preset/80-bluez.preset
