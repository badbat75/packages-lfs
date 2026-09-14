# dhcpcd
PKG_VER=10.0.8
PKG_URL="https://github.com/NetworkConfiguration/dhcpcd/releases/download/v${PKG_VER}/dhcpcd-${PKG_VER}.tar.xz"
PKG_COPYSRC=1
BUILD_PROCESS=configmake
CONF_FLAGS="--runstatedir=/run/dhcpcd --dbdir=/var/lib/dhcpcd --privsepuser=dhcpcd"
#PKG_MAKETARGETS="all,install"

PKG_PREBUILD="sed '/Deny everything else/i SECCOMP_ALLOW(__NR_getrandom),' -i src/privsep-linux.c
	sed '/^if \\[ -n \"\$INCLUDEDIR\" \\]; then/,+2d' -i configure"
PKG_POSTBUILD="install  -v -m700 -d \${PKG_PKGPATH}/var/lib/dhcpcd
    mkdir -pv \${PKG_PKGPATH}/lib/systemd/system
    cat >\${PKG_PKGPATH}/lib/systemd/system/dhcpcd5.dhcpcd.service <<-EOF
		[Unit]
		Description=DHCP Client Daemon on all interfaces
		Wants=network.target
		Before=network.target
		Documentation=man:dhcpcd(8)

		[Service]
		Type=forking
		PIDFile=/run/dhcpcd/pid
		ExecStart=/usr/sbin/dhcpcd -q -b
		ExecStop=/usr/sbin/dhcpcd -x
		RuntimeDirectory=dhcpcd
		#
		# sandboxing
		#
		ProtectSystem=strict
		ReadWritePaths=/var/lib/dhcpcd /run/dhcpcd /etc/resolv.conf
		ProtectHome=true
		PrivateTmp=true
		PrivateDevices=true
		ProtectClock=true
		ProtectKernelModules=true
		ProtectKernelLogs=true
		ProtectControlGroups=true
		RestrictNamespaces=true
		LockPersonality=true
		MemoryDenyWriteExecute=true
		RestrictRealtime=true
		RestrictSUIDSGID=true
		SystemCallFilter=@system-service
		SystemCallErrorNumber=EPERM
		SystemCallArchitectures=native

		[Install]
		WantedBy=multi-user.target
	EOF
    cat >\${PKG_PKGPATH}/lib/systemd/system/dhcpcd5.dhcpcd@.service <<-EOF
		[Unit]
		Description=DHCP Client Daemon on %I
		Wants=network.target
		Before=network.target
		BindsTo=sys-subsystem-net-devices-%i.device
		After=sys-subsystem-net-devices-%i.device
		Documentation=man:dhcpcd(8)

		[Service]
		Type=forking
		PIDFile=/run/dhcpcd/%I.pid
		ExecStart=/usr/sbin/dhcpcd -q -w %I
		ExecStop=/usr/sbin/dhcpcd -x %I
		Restart=always

		[Install]
		WantedBy=multi-user.target
		EOF
"
PKG_POSTINSTALL="if ! getent group dhcpcd; then
	groupadd --system -g 52 dhcpcd
fi
if ! getent passwd dhcpcd; then
	useradd --system -c \"DHCP Client Daemon\" -d /var/lib/dhcpcd -g dhcpcd -s /sbin/nologin -u 52 dhcpcd
fi
chown -v dhcpcd:dhcpcd /var/lib/dhcpcd"