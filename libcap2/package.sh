# libcap2
PKG_VER=2.70
PKG_URL="https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-${PKG_VER}.tar.xz"
BUILD_PROCESS=simplemake
PKG_MAKEVARS="lib=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} BUILD_CC=\"\${CC_FOR_BUILD}\" COPTS=\"\${CFLAGS_FOR_BUILD}\" BUILD_LDFLAGS=\"\${LDFLAGS_FOR_BUILD}\""
PKG_MAKETARGETS="all,install"

PKG_PREBUILD="sed -i 's/:= \$(CROSS_COMPILE)/?= \$(CROSS_COMPILE)/g' Make.Rules
	sed -i 's/\$(CC) -o/\$(CC) \$(CFLAGS) -o/g' libcap/Makefile"

case ${PKG_TARGET} in
	bootstrap)
	;;
	*)
		PKG_DEPS="lfs/libcap2:bootstrap lfs/Linux-PAM"
		PKG_MAKETARGETS+=",-C pam_cap"
		PKG_POSTBUILD="install -v -m755 -d \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/security
			install -v -m755 pam_cap/pam_cap.so \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/security
			install -v -m755 -d \${PKG_PKGPATH}/etc/security
			install -v -m644 pam_cap/capability.conf \${PKG_PKGPATH}/etc/security
			install -v -m755 -d \${PKG_PKGPATH}/etc/pam.d
			cat > \${PKG_PKGPATH}/etc/pam.d/system-auth <<-EOF
				# Begin /etc/pam.d/system-auth

				auth      optional    pam_cap.so
				auth      required    pam_unix.so

				# End /etc/pam.d/system-auth
			EOF
			"
	;;
esac