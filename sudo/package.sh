# sudo
PKG_VER=1.9.16p2
PKG_URL="https://www.sudo.ws/dist/sudo-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/Linux-PAM lfs/krb5 lfs/zlib"
BUILD_PROCESS=configmake
CONF_FLAGS="--libexecdir=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} \
			--with-secure-path \
			--with-all-insults \
			--with-env-editor \
			--docdir=/usr/share/doc/sudo-${PKG_VER} \
			--with-passprompt='[sudo] password for %p: '"
#PKG_MAKETARGETS="all,install"
PKG_MAKEVARS="install_uid=$(id -u) install_gid=$(id -g)"
PKG_POSTBUILD="cat > \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/sudoers.d/sudo <<-EOF
		Defaults secure_path=\"/usr/bin:/bin:/usr/sbin:/sbin\"
		#%wheel ALL=(ALL) ALL
		%wheel ALL=(ALL) NOPASSWD: ALL
	EOF
	install -vdm755 \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d/
	cat > \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d/sudo <<-EOF
		# Begin /etc/pam.d/sudo

		# include the default auth settings
		auth      include     system-auth

		# include the default account settings
		account   include     system-account

		# Set default environment variables for the service user
		session   required    pam_env.so

		# include system session defaults
		session   include     system-session

		# End /etc/pam.d/sudo
	EOF
	chmod 644 \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d/sudo
"