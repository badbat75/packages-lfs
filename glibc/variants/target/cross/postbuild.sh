# shellcheck shell=bash
# shellcheck disable=SC2154
# glibc, target cross: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).

ln -sfv ${INSTALL_PREFIX}/glibc${GLIBC_VER}/bin/localedef ${INSTALL_PREFIX}/bin
install -vdm755 ${INSTALL_PREFIX}/glibc${GLIBC_VER}/lib/locale
patchelf --remove-rpath ${INSTALL_PREFIX}/glibc${GLIBC_VER}/lib/ld-linux*.so.*
if [ ! -f ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/gnu/stubs.h ]
then
	install -vDm644 /dev/null ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/gnu/stubs.h
fi
