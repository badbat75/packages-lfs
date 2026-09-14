# shellcheck shell=bash
# shellcheck disable=SC2154
# systemd: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	bootstrap) ;;
	*)
		install -v -m755 -d ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d
		cat >> ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d/system-session <<-EOF
			# Begin Systemd addition

			session  required    pam_unix.so
			session  required    pam_loginuid.so
			session  optional    pam_systemd.so

			# End Systemd addition
		EOF

		cat > ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/pam.d/systemd-user <<-EOF
			# Begin ${INSTALL_SYSCONFDIR}/pam.d/systemd-user

			account  required    pam_access.so
			account  include     system-account

			session  required    pam_env.so
			session  required    pam_limits.so
			session  include     system-session
			session  optional    pam_keyinit.so force revoke
			session  required    pam_namespace.so

			auth     required    pam_deny.so
			password required    pam_deny.so

			# End ${INSTALL_SYSCONFDIR}/pam.d/systemd-user
		EOF

		install -vdm755 ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/systemd/system/getty@tty1.service.d
		cat >> ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/systemd/system/getty@tty1.service.d/noclear.conf <<-EOF
			[Service]
			TTYVTDisallocate=no
		EOF

		cat >> ${PKG_PKGPATH}${INSTALL_LIBDIR}/udev/rules.d/60-block-scheduler.rules <<-EOF
			ACTION=="add", SUBSYSTEM=="block", ENV{DEVTYPE}=="disk", KERNEL=="mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|sd*[!0-9]|sr*", ATTR{queue/scheduler}="bfq"
		EOF

		ln -sfv /dev/null ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/systemd/system/tmp.mount
	;;
esac
