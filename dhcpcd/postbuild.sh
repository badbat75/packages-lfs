# shellcheck shell=bash
# shellcheck disable=SC2154
# dhcpcd: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install  -v -m700 -d ${PKG_PKGPATH}/var/lib/dhcpcd
    mkdir -pv ${PKG_PKGPATH}/lib/systemd/system
    cat >${PKG_PKGPATH}/lib/systemd/system/dhcpcd5.dhcpcd.service <<-EOF
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
    cat >${PKG_PKGPATH}/lib/systemd/system/dhcpcd5.dhcpcd@.service <<-EOF
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
