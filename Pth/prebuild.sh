# shellcheck shell=bash
# shellcheck disable=SC2154
# Pth: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i 's#$(LOBJS): Makefile#$(LOBJS): pth_p.h Makefile#' Makefile.in
	if  [ -n "$(find ${BIN_PATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} -name *.la -mindepth 1 -maxdepth 1)" ]
	then
	   mkdir -pv ${PKG_BLDPATH}/la_libraries_backup
	   mv -v ${BIN_PATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/*.la ${PKG_BLDPATH}/la_libraries_backup
	fi
