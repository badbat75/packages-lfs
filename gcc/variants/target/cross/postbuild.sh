# shellcheck shell=bash
# shellcheck disable=SC2154
# gcc, target cross and cross-stage1: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the postbuild.sh of the recipe.

### The limits.h of the compiler includes the one of the C library
"${INSTALL_PREFIX}/libexec/gcc/${HARCH}/${GCC_MAJVER}/install-tools/mkheaders"
mkdir -pv "${INSTALL_SHAREDIR}/aclocal"
### lib64 is found through ../lib64 of the library directory of the sysroot
if [ "${HARCH_LIB}" == 64 ] && [ ! -d "${GCC_SYSROOT}${TARGET_PREFIX}/lib" ]
then
	mkdir -pv "${GCC_SYSROOT}${TARGET_PREFIX}/lib"
fi
