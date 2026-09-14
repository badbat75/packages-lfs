# Pth
PKG_VER=2.0.7
PKG_URL="https://ftp.gnu.org/gnu/pth/pth-2.0.7.tar.gz"
PKG_DEPS="lfs/libnsl"
#PKG_AUTOCONF=1
BUILD_PROCESS=configmake
CONF_FLAGS="--mandir=${INSTALL_SHAREDIR}/man --build= --host="
PKG_MAKETARGETS="all,-j1 install-strip"
PKG_TOOLCHAIN=gnu

### This packages does not support newer .la libraries file so they will be temporary moved somewhere else
PKG_PREBUILD="sed -i 's#\$(LOBJS): Makefile#\$(LOBJS): pth_p.h Makefile#' Makefile.in
	if  [ -n \"\$(find ${BIN_PATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} -name "*.la" -mindepth 1 -maxdepth 1)\" ]
	then
	   mkdir -pv \${PKG_BLDPATH}/la_libraries_backup
	   mv -v ${BIN_PATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/*.la \${PKG_BLDPATH}/la_libraries_backup
	fi"
PKG_POSTBUILD="install -v -m755 -d \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/pth-2.0.7
	install -v -m644 \${PKG_SRCPATH}/{README,PORTING,SUPPORT,TESTS} \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/pth-2.0.7
	if [ -d la_libraries_backup ]
	then
		mv -v la_libraries_backup/* ${BIN_PATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/
	fi"