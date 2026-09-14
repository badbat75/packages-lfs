# shellcheck shell=bash
# shellcheck disable=SC2154
# Linux-PAM: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	bootstrap) ;;
	*)
		install -vdm755 ${PKG_PKGPATH}/etc/pam.d
		cat > ${PKG_PKGPATH}/etc/pam.d/other <<-EOF
			# Begin /etc/pam.d/other

			auth        required        pam_warn.so
			auth        required        pam_deny.so
			account     required        pam_warn.so
			account     required        pam_deny.so
			password    required        pam_warn.so
			password    required        pam_deny.so
			session     required        pam_warn.so
			session     required        pam_deny.so

			# End /etc/pam.d/other
		EOF

		cat > ${PKG_PKGPATH}/etc/pam.d/system-account <<-EOF
			# Begin /etc/pam.d/system-account

			account   required    pam_unix.so

			# End /etc/pam.d/system-account
		EOF

		cat > ${PKG_PKGPATH}/etc/pam.d/system-auth <<-EOF
			# Begin /etc/pam.d/system-auth

			auth      required    pam_unix.so

			# End /etc/pam.d/system-auth
		EOF

		cat > ${PKG_PKGPATH}/etc/pam.d/system-session <<-EOF
			# Begin /etc/pam.d/system-session

			session   required    pam_unix.so

			# End /etc/pam.d/system-session
		EOF

		chmod -v 4755 ${PKG_PKGPATH}/sbin/unix_chkpwd
	;;
esac
