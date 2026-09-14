# shellcheck shell=bash
# shellcheck disable=SC2154
# fuse: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

chmod u+s ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/fusermount3
	install -vdm755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/fuse-${PKG_VER}
	install -v -m644 ${PKG_SRCPATH}/doc/{README.NFS,kernel.txt} ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/fuse-${PKG_VER}
	cp -Rv ${PKG_SRCPATH}/doc/html ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/fuse-${PKG_VER}
	install -vdm755 ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}
	cat > ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/fuse.conf <<-EOF
		# Set the maximum number of FUSE mounts allowed to non-root users.
		# The default is 1000.
		#
		#mount_max = 1000

		# Allow non-root users to specify the 'allow_other' or 'allow_root'
		# mount options.
		#
		#user_allow_other
	EOF
