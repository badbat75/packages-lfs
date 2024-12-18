# openssh
PKG_VER=9.9p1
PKG_URL="http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/Linux-PAM lfs/krb5 lfs/net-tools lfs/Linux-PAM lfs/libedit lfs/sysstat lfs/xauth lfs/zlib"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--sysconfdir=${INSTALL_SYSCONFDIR}/ssh \
		--with-privsep-path=/var/lib/sshd \
		--with-default-path=${INSTALL_EXECPREFIX}/bin \
		--with-superuser-path=${INSTALL_EXECPREFIX}/sbin:${INSTALL_EXECPREFIX}/bin \
		--with-pid-dir=/run \
		--with-pam \
		--with-kerberos5=${INSTALL_PREFIX} \
		--with-libedit \
		--with-xauth=/usr/bin/xauth"
PKG_MAKETARGETS=",install"
PKG_PREBUILD="sed -i '/^STRIP_OPT/ s/-s$/\"-s --strip-program=\$STRIP\"/' configure.ac
	sed -e '/INSTALLKEYS_SH/s/)//' -e '260a\  )' -i contrib/ssh-copy-id"
PKG_POSTBUILD="mkdir -pv \${PKG_PKGPATH}/lib/systemd/system
	cat <<-EOF >\${PKG_PKGPATH}/lib/systemd/system/sshd.service
		[Unit]
		Description=OpenSSH Daemon

		[Service]
		ExecStart=/usr/sbin/sshd -D
		ExecReload=/bin/kill -HUP $MAINPID
		KillMode=process
		Restart=always

		[Install]
		WantedBy=multi-user.target
	EOF
	cat <<-EOF >\${PKG_PKGPATH}/lib/systemd/system/sshd.socket
		[Unit]
		Conflicts=sshd.service

		[Socket]
		ListenStream=22
		Accept=yes

		[Install]
		WantedBy=sockets.target
	EOF
	cat <<-EOF >\${PKG_PKGPATH}/lib/systemd/system/sshd\@.service
		[Unit]
		Description=SSH Per-Connection Server

		[Service]
		ExecStart=/usr/sbin/sshd -i
		StandardInput=socket
	EOF
	"
#### Pam configuration (pam.d module copied from shadow package)
PKG_POSTBUILD+="install -vdm755 \${PKG_PKGPATH}/etc/pam.d
	cat <<-'EOF' >\${PKG_PKGPATH}/etc/pam.d/sshd
		# Begin /etc/pam.d/sshd

		# Set failure delay before next prompt to 3 seconds
		auth      optional    pam_faildelay.so  delay=3000000

		# Check to make sure that the user is allowed to login
		auth      requisite   pam_nologin.so

		# Check to make sure that root is allowed to login
		# Disabled by default. You will need to create /etc/securetty
		# file for this module to function. See man 5 securetty.
		#auth      required    pam_securetty.so

		# Additional group memberships - disabled by default
		#auth      optional    pam_group.so

		# include system auth settings
		auth      include     system-auth

		# check access for the user
		account   required    pam_access.so

		# include system account settings
		account   include     system-account

		# Set default environment variables for the user
		session   required    pam_env.so

		# Set resource limits for the user
		session   required    pam_limits.so

		# Display date of last login - Disabled by default
		#session   optional    pam_lastlog.so

		# Display the message of the day - Disabled by default
		#session   optional    pam_motd.so

		# Check user's mail - Disabled by default
		#session   optional    pam_mail.so      standard quiet

		# include system session and password settings
		session   include     system-session
		password  include     system-password

		# End /etc/pam.d/sshd
	EOF
	sed -e 's/#UsePAM no/UsePAM yes/' \
		-e 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' \
		-e 's/#KbdInteractiveAuthentication yes/KbdInteractiveAuthentication no/' \
		-i \${PKG_PKGPATH}/etc/ssh/sshd_config
	"
### This is too restrictive
## -e 's/#PasswordAuthentication yes/PasswordAuthentication no/' \

PKG_POSTINSTALL="install  -v -m700 -d /var/lib/sshd
if ! getent group sshd; then
	groupadd --system -g 50 sshd
fi
if ! getent passwd sshd; then
	useradd --system -c 'sshd PrivSep' -d /var/lib/sshd -g sshd -s /sbin/nologin -u 50 sshd
fi"