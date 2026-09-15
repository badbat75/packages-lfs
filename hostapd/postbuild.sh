# shellcheck shell=bash
# shellcheck disable=SC2154
# hostapd: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -d ${PKG_PKGPATH}${INSTALL_PREFIX}/sbin
install -d ${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man1
install -d ${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man8
install --mode=755 -s --strip-program=${HARCH:+${HARCH}-}strip -D hostapd/hostapd ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/sbin/
install --mode=755 -s --strip-program=${HARCH:+${HARCH}-}strip -D hostapd/hostapd_cli ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/sbin/
install -d ${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man{5,8}
cp hostapd/hostapd.8 ${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man8/ && gzip -f ${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man8/hostapd.8
cp hostapd/hostapd_cli.1 ${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man5/ && gzip -f ${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man5/hostapd_cli.1

mkdir -pv ${PKG_PKGPATH}/lib/systemd/system
cat > ${PKG_PKGPATH}/lib/systemd/system/hostapd.service <<-EOF
	[Unit]
	Description=Access point and authentication server for Wi-Fi and Ethernet
	Documentation=man:hostapd(8)
	After=network.target

	[Service]
	Type=forking
	PIDFile=/run/hostapd.pid
	Restart=on-failure
	RestartSec=2
	Environment=DAEMON_CONF=/etc/hostapd/hostapd.conf
	EnvironmentFile=-/etc/default/hostapd
	ExecStart=/usr/sbin/hostapd -B -P /run/hostapd.pid -B \$DAEMON_OPTS \${DAEMON_CONF}

	[Install]
	WantedBy=multi-user.target
EOF
cat > ${PKG_PKGPATH}/lib/systemd/system/hostapd@.service <<-EOF
	[Unit]
	Description=Access point and authentication server for Wi-Fi and Ethernet (%I)
	Documentation=man:hostapd(8)
	After=network.target
	BindsTo=sys-subsystem-net-devices-%i.device

	[Service]
	Type=forking
	PIDFile=/run/hostapd.%i.pid
	Restart=on-failure
	RestartSec=2
	EnvironmentFile=-/etc/default/hostapd
	ExecStart=/usr/sbin/hostapd -B -P /run/hostapd.%i.pid \$DAEMON_OPTS /etc/hostapd/%i.conf

	[Install]
	WantedBy=multi-user.target sys-subsystem-net-devices-%i.device
EOF

mkdir -pv ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/default
cat > ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/default/hostapd <<-EOF
	# Defaults for hostapd initscript
	#
	# WARNING: The DAEMON_CONF setting has been deprecated and will be removed
	#          in future package releases.
	#
	# See /usr/share/doc/hostapd/README.Debian for information about alternative
	# methods of managing hostapd.
	#
	# Uncomment and set DAEMON_CONF to the absolute path of a hostapd configuration
	# file and hostapd will be started during system boot. An example configuration
	# file can be found at /usr/share/doc/hostapd/examples/hostapd.conf.gz
	#
	#DAEMON_CONF=""

	# Additional daemon options to be appended to hostapd command:-
	#       -d   show more debug messages (-dd for even more)
	#       -K   include key data in debug messages
	#       -t   include timestamps in some debug messages
	#
	# Note that -B (daemon mode) and -P (pidfile) options are automatically
	# configured by the init.d script and must not be added to DAEMON_OPTS.
	#
	#DAEMON_OPTS=""
EOF
