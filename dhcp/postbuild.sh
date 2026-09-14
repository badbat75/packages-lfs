# shellcheck shell=bash
# shellcheck disable=SC2154
# dhcp: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}/sbin
	install -vdm755  ${PKG_PKGPATH}/var/lib/dhclient
	install -vm755 ${PKG_SRCPATH}/client/scripts/linux ${PKG_PKGPATH}/sbin/dhclient-script

	install -vdm755 ${PKG_PKGPATH}/lib/systemd/system
	cat >${PKG_PKGPATH}/lib/systemd/system/dhclient@.service <<-EOF
		[Unit]
		Description=ISC DHCP Client on %I
		Wants=network.target
		Before=network.target
		BindsTo=sys-subsystem-net-devices-%i.device
		After=sys-subsystem-net-devices-%i.device

		[Service]
		Type=forking
		PIDFile=/run/dhclient-%I.pid
		ExecStart=/sbin/dhclient -pf /run/dhclient-%I.pid -lf /var/lib/dhclient/dhclient-%I.lease %I
		ExecStop=/sbin/dhclient -r -pf /run/dhclient-%I.pid -lf /var/lib/dhclient/dhclient-%I.lease %I

		[Install]
		WantedBy=multi-user.target
	EOF

	install -vdm755 ${PKG_PKGPATH}/etc/dhcp
	cat > ${PKG_PKGPATH}/etc/dhcp/dhclient.conf <<-EOF
		# Begin /etc/dhcp/dhclient.conf
		#
		# Basic dhclient.conf(5)

		#prepend domain-name-servers 127.0.0.1;
		request subnet-mask, broadcast-address, time-offset, routers,
				domain-name, domain-name-servers, domain-search, host-name,
				netbios-name-servers, netbios-scope, interface-mtu,
				ntp-servers;
		require subnet-mask, domain-name-servers;
		#timeout 60;
		#retry 60;
		#reboot 10;
		#select-timeout 5;
		#initial-interval 2;

		# End /etc/dhcp/dhclient.conf
	EOF

	cat > ${PKG_PKGPATH}/etc/dhcp/dhcpd.conf <<-EOF
		# Begin /etc/dhcp/dhcpd.conf
		#
		# Example dhcpd.conf(5)

		# Use this to enable / disable dynamic dns updates globally.
		ddns-update-style none;

		# option definitions common to all supported networks...
		option domain-name "example.org";
		option domain-name-servers ns1.example.org, ns2.example.org;

		default-lease-time 600;
		max-lease-time 7200;

		# This is a very basic subnet declaration.
		subnet 10.254.239.0 netmask 255.255.255.224 {
		range 10.254.239.10 10.254.239.20;
		option routers rtr-239-0-1.example.org, rtr-239-0-2.example.org;
		}

		# End /etc/dhcp/dhcpd.conf
	EOF
