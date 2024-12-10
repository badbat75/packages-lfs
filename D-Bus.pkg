# D-Bus
PKG_VER=1.14.10
PKG_URL="https://dbus.freedesktop.org/releases/dbus/dbus-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/doxygen:native lfs/xmlto:native"
PKG_DEPS+=" lfs/expat lfs/libX11"
PKG_DEPS+=" lfs/systemd:bootstrap"
PKG_DEPS+=" lfs/libaudit:bootstrap"
PKG_DEPS+=" lfs/libcap2:bootstrap"
PKG_AUTOCONF=1
BUILD_PROCESS=configmake
CONF_FLAGS="--enable-user-session"
CONF_FLAGS+=" --enable-inotify"
CONF_FLAGS+=" --enable-libaudit"
CONF_FLAGS+=" --enable-systemd"
CONF_FLAGS+=" --disable-asserts"
CONF_FLAGS+=" --disable-doxygen-docs"
CONF_FLAGS+=" --disable-xml-docs"
CONF_FLAGS+=" --disable-tests"
#CONF_FLAGS+=" --enable-installed-tests"
CONF_FLAGS+=" --localstatedir=${INSTALL_LOCALSTATEDIR}"
CONF_FLAGS+=" --runstatedir=/run"
CONF_FLAGS+=" --with-system-socket=/run/dbus/system_bus_socket"
CONF_FLAGS+=" --with-systemdsystemunitdir=/lib/systemd/system"
CONF_FLAGS+=" --with-systemduserunitdir=${INSTALL_PREFIX}/lib/systemd/user"
CONF_FLAGS+=" --docdir=${INSTALL_SHAREDIR}/doc/dbus-${PKG_VER}"
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed 's/static dbus_bool_t fatal_warnings_on_check_failed = TRUE/static dbus_bool_t fatal_warnings_on_check_failed = FALSE/' -i dbus/dbus-internals.c"
PKG_POSTBUILD="cat >>\${PKG_PKGPATH}/lib/systemd/system/dbus.service <<-EOF

		[Install]
		# Make sure that services can still refer to this under the name of the
		# old SysV script (messagebus).
		Alias=messagebus.service
		WantedBy=multi-user.target
	EOF

	cat >>\${PKG_PKGPATH}/lib/systemd/system/dbus.socket <<-EOF

		[Install]
		WantedBy=sockets.target
	EOF

	cat >>\${PKG_PKGPATH}${INSTALL_PREFIX}/lib/systemd/user/dbus.service <<-EOF

		[Install]
	EOF

	cat >>\${PKG_PKGPATH}${INSTALL_PREFIX}/lib/systemd/user/dbus.socket <<-EOF

		[Install]
		WantedBy=sockets.target
	EOF

	install -vdm755 \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/X11/xinit/xinitrc.d/
	cat >>\${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/X11/xinit/xinitrc.d/00-start-message-bus.sh <<-EOF
		#!/bin/sh
		if [ -z \"\\\$DBUS_SESSION_BUS_ADDRESS\" ]; then
		   eval \\\`dbus-launch --sh-syntax --exit-with-session\\\`
		fi
	EOF
	chmod +x \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/X11/xinit/xinitrc.d/00-start-message-bus.sh
	"

PKG_POSTINSTALL="ln -sfv /etc/machine-id ${INSTALL_LOCALSTATEDIR}/lib/dbus/machine-id
chown -v root:messagebus ${INSTALL_PREFIX}/libexec/dbus-daemon-launch-helper
chmod -v 4750 ${INSTALL_PREFIX}/libexec/dbus-daemon-launch-helper
systemctl preset dbus.socket
systemctl --global preset dbus.socket
systemctl preset dbus.service
systemctl --global preset dbus.service"

PKG_POSTINSTALL_PRIO=11
