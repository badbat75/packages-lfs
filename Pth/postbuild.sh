# shellcheck shell=bash
# shellcheck disable=SC2154
# Pth: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -m755 -d ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/pth-2.0.7
	install -v -m644 ${PKG_SRCPATH}/{README,PORTING,SUPPORT,TESTS} ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/pth-2.0.7
	if [ -d la_libraries_backup ]
	then
		mv -v la_libraries_backup/* ${BIN_PATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/
	fi
