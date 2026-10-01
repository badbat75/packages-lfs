# shellcheck shell=bash
# shellcheck disable=SC2154
# gcc, target libraries (libgcc, libstdc++-v3...): post-build script, sourced by runpostbuild.sh
# (cwd: ${PKG_BLDPATH}, set -ex). Replaces the postbuild.sh of the recipe.

GCC_LIBRARY=${PKG_TARGET}
GCC_LIBDIR=${INSTALL_PREFIX}/lib/gcc/${HARCH}/${GCC_MAJVER}
### libstdc++-v3/python/gdb.py holds pythondir and toolexeclibdir, written once from the prefix of the
### make run that creates it: removed before each install, the toolchain copy gets the toolchain
### directories and the package copy the image ones
GDB_PY=${HARCH}/libstdc++-v3/python/gdb.py
### The tree was configured by gcc:cross: the compilers and flags of this environment stay out of it
# shellcheck disable=SC2046
unset $( sed -n 's/^export \([A-Za-z_0-9]*\)=.*/\1/p' "${PKG_BLDPATH}/environment.source" | grep -vx -e PATH -e LC_ALL )
cd "${GCC_CROSS_BLDPATH}"
### libgcc with posix threads, now that the C library is there
mkdir -pv "${HARCH}/libgcc"
ln -fsv "${PKG_SRCPATH}/libgcc/gthr-posix.h" "${HARCH}/libgcc/gthr-default.h"
make V="${MAKEVERBOSE:-0}" STAGE_CC_WRAPPER="${GCC_STAGE_CC_WRAPPER}" "all-target-${GCC_LIBRARY}"
rm -fv "${GDB_PY}"
make V="${MAKEVERBOSE:-0}" STAGE_CC_WRAPPER="${GCC_STAGE_CC_WRAPPER}" "install-strip-target-${GCC_LIBRARY}"
rm -fv "${TOOLCHAIN_PATH}/lib/gcc/${HARCH}/${GCC_MAJVER}/"*.la
if [ "${GCC_PACKAGE_LIBRARY}" -eq 0 ]
then
	return 0
fi
rm -fv "${GDB_PY}"
make V="${MAKEVERBOSE:-0}" STAGE_CC_WRAPPER="${GCC_STAGE_CC_WRAPPER}" DESTDIR="${PKG_PKGPATH}" prefix="${INSTALL_PREFIX}" "install-strip-target-${GCC_LIBRARY}"
rm -fv "${PKG_PKGPATH}${GCC_LIBDIR}/"*.la
if [ "${WITH_MAIN_GCC}" -eq 1 ]
then
	### Linked with their relative paths into the library directory of the sysroot
	mkdir -pv "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
	find "${PKG_PKGPATH}${INSTALL_PREFIX}/lib/gcc/${HARCH}" -type f,l \
		\( -name "*.so*" -a ! -name "*.so*.py" -o -name "*.a*" -o -name "*.la*" -o -name "crt*.o" \) | \
		while read -r GCC_FILE
		do
			ln -fsv "$( realpath -m --relative-to="${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}" "${GCC_FILE}" )" \
				"${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/${GCC_FILE##*/}"
		done
else
	### Found by the loader through ld.so.conf.d, ldconfig run on the image
	mkdir -pv "${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/ld.so.conf.d" "${PKG_PKGPATH}/postinst_scripts"
	echo "${GCC_LIBDIR}" > "${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/ld.so.conf.d/gcc-${GCC_MAJVER}.conf"
	if [ -d "${TOOLCHAIN_PATH}/lib/gcc/${HARCH}/lib64" ]
	then
		echo "${INSTALL_PREFIX}/lib/gcc/${HARCH}/lib64" >> "${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/ld.so.conf.d/gcc-${GCC_MAJVER}.conf"
	fi
	echo "ldconfig -v" > "${PKG_PKGPATH}/postinst_scripts/00_gcc-libs_${GCC_MAJVER}"
fi
