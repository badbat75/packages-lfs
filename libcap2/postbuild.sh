# shellcheck shell=bash
# shellcheck disable=SC2154
# libcap2: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	bootstrap) ;;
	*)
		install -v -m755 -d ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/security
		install -v -m755 pam_cap/pam_cap.so ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/security
		install -v -m755 -d ${PKG_PKGPATH}/etc/security
		install -v -m644 pam_cap/capability.conf ${PKG_PKGPATH}/etc/security
		install -v -m755 -d ${PKG_PKGPATH}/etc/pam.d
		cat > ${PKG_PKGPATH}/etc/pam.d/system-auth <<-EOF
			# Begin /etc/pam.d/system-auth

			auth      optional    pam_cap.so
			auth      required    pam_unix.so

			# End /etc/pam.d/system-auth
		EOF
	;;
esac
