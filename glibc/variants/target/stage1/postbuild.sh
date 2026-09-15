# shellcheck shell=bash
# shellcheck disable=SC2154
# glibc, target stage1: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Installs the start files and an empty libc.so so that the bootstrap gcc can link.

mkdir -pv ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
install csu/crt1.o csu/crti.o csu/crtn.o ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
${CC} ${CFLAGS} ${LDFLAGS} -nostdlib -nostartfiles -shared -x c /dev/null -o ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libc.so
if [ ! -f ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/gnu/stubs.h ]
then
	install -vDm644 /dev/null ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/gnu/stubs.h
fi
