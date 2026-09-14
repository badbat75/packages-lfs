# shellcheck shell=bash
# shellcheck disable=SC2154
# polkit: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

chmod -v 04755 ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/polkit-1/polkit-agent-helper-1
	cat > ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d/polkit-1 <<-EOF
		# Begin ${INSTALL_SYSCONFDIR}/pam.d/polkit-1

		auth     include        system-auth
		account  include        system-account
		password include        system-password
		session  include        system-session

		# End ${INSTALL_SYSCONFDIR}/pam.d/polkit-1
	EOF
