# shellcheck shell=bash
# shellcheck disable=SC2154
# usb-utils: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -dm755 ${PKG_PKGPATH}/usr/share/hwdata/
	curl http://www.linux-usb.org/usb.ids -o ${PKG_PKGPATH}/usr/share/hwdata/usb.ids
	#cat > ${PKG_PKGPATH}/lib/systemd/system/update-usbids.service <<-EOF
	#	[Unit]
	#	Description=Update usb.ids file
	#	Documentation=man:lsusb(8)
	#	DefaultDependencies=no
	#	After=local-fs.target network-online.target
	#	Before=shutdown.target
	#
	#	[Service]
	#	Type=oneshot
	#	RemainAfterExit=yes
	#	ExecStart=/usr/bin/wget http://www.linux-usb.org/usb.ids -O /usr/share/hwdata/usb.ids
	#EOF
	#	cat > ${PKG_PKGPATH}/lib/systemd/system/update-usbids.timer <<-EOF
	#	[Unit]
	#	Description=Update usb.ids file weekly
	#
	#	[Timer]
	#	OnCalendar=Sun 03:00:00
	#	Persistent=true
	#
	#	[Install]
	#	WantedBy=timers.target
	#EOF
	#systemctl --root=${PKG_PKGPATH} enable update-usbids.timer
