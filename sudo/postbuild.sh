# shellcheck shell=bash
# shellcheck disable=SC2154
# sudo: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

cat > ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/sudoers.d/sudo <<-EOF
		Defaults secure_path="/usr/bin:/bin:/usr/sbin:/sbin"
		#%wheel ALL=(ALL) ALL
		%wheel ALL=(ALL) NOPASSWD: ALL
	EOF
	install -vdm755 ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d/
	cat > ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d/sudo <<-EOF
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
	chmod 644 ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d/sudo
