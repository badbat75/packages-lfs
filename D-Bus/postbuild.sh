# shellcheck shell=bash
# shellcheck disable=SC2154
# D-Bus: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

cat >>${PKG_PKGPATH}/lib/systemd/system/dbus.service <<-EOF

		[Install]
		# Make sure that services can still refer to this under the name of the
		# old SysV script (messagebus).
		Alias=messagebus.service
		WantedBy=multi-user.target
	EOF

	cat >>${PKG_PKGPATH}/lib/systemd/system/dbus.socket <<-EOF

		[Install]
		WantedBy=sockets.target
	EOF

	cat >>${PKG_PKGPATH}${INSTALL_PREFIX}/lib/systemd/user/dbus.service <<-EOF

		[Install]
	EOF

	cat >>${PKG_PKGPATH}${INSTALL_PREFIX}/lib/systemd/user/dbus.socket <<-EOF

		[Install]
		WantedBy=sockets.target
	EOF

	install -vdm755 ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/X11/xinit/xinitrc.d/
	cat >>${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/X11/xinit/xinitrc.d/00-start-message-bus.sh <<-EOF
		#!/bin/sh
		if [ -z "\$DBUS_SESSION_BUS_ADDRESS" ]; then
		   eval \`dbus-launch --sh-syntax --exit-with-session\`
		fi
	EOF
	chmod +x ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/X11/xinit/xinitrc.d/00-start-message-bus.sh
