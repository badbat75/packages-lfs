# usb-utils
PKG_VER=015
PKG_URL="https://www.kernel.org/pub/linux/utils/usb/usbutils/usbutils-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/libusb"

#PKG_OVERRIDELTO=0
PKG_COPYSRC=1
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
#PKG_MAKETARGETS="all,install"
PKG_MAKEVARS="PREFIX=\${PKG_PKGPATH}${INSTALL_PREFIX}"
CONF_FLAGS=""
PKG_POSTBUILD="install -dm755 \${PKG_PKGPATH}/usr/share/hwdata/
	curl http://www.linux-usb.org/usb.ids -o \${PKG_PKGPATH}/usr/share/hwdata/usb.ids
	#cat > \${PKG_PKGPATH}/lib/systemd/system/update-usbids.service <<-EOF
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
	#	cat > \${PKG_PKGPATH}/lib/systemd/system/update-usbids.timer <<-EOF
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
	#systemctl --root=\${PKG_PKGPATH} enable update-usbids.timer"