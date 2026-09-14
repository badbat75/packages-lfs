# shellcheck shell=bash
# shellcheck disable=SC2154
# Tcl: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

#sed -e "s@${PKG_BLDPATH}/unix@${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}@g" -i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/{tclConfig.sh,tdbc1.1.5/tdbcConfig.sh,itcl4.2.3/itclConfig.sh}

	ln -v -sfv tclsh8.6 ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/tclsh
	mv ${PKG_PKGPATH}${INSTALL_SHAREDIR}/man/man3/{Thread,Tcl_Thread}.3
	chmod -v 755 ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libtcl8.6.so
