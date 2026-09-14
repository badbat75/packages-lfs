# shellcheck shell=bash
# shellcheck disable=SC2154
# rsync: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}
	cat > ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/rsyncd.conf <<-EOF
		# This is a basic rsync configuration file
		# It exports a single module without user authentication.

		motd file = /home/rsync/welcome.msg
		use chroot = yes

		[localhost]
		    path = /home/rsync
		    comment = Default rsync module
		    read only = yes
		    list = yes
		    uid = rsyncd
		    gid = rsyncd

	EOF

	install -vdm755 ${PKG_PKGPATH}/lib/systemd/system
	cat > ${PKG_PKGPATH}/lib/systemd/system/rsyncd.socket <<-EOF
		[Unit]
		Description=Rsync Socket
		Conflicts=rsyncd.service

		[Socket]
		ListenStream=873
		Accept=true

		[Install]
		WantedBy=sockets.target
	EOF

	cat > ${PKG_PKGPATH}/lib/systemd/system/rsyncd.service <<-EOF
		[Unit]
		Description=A file transfer program to keep remote files in sync
		ConditionPathExists=/etc/rsyncd.conf

		[Service]
		ExecStart=/usr/bin/rsync --daemon --no-detach
		RestartSec=1

		[Install]
		WantedBy=multi-user.target
	EOF

	cat > ${PKG_PKGPATH}/lib/systemd/system/rsyncd@.service <<-EOF
		[Unit]
		Description=A file transfer program to keep remote files in sync
		ConditionPathExists=/etc/rsyncd.conf

		[Service]
		ExecStart=/usr/bin/rsync --daemon --no-detach
		StandardInput=socket
	EOF
