# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The ${CMAKE_SYSROOT} inside the sed expressions is literal text for CMake, not a shell variable.

case ${PKG_TARGET} in
	native) ;;
	*)
		CMAKEDIR=${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/llvm
		sed -i 's|^set(LLVM_INSTALL_PREFIX "|set(LLVM_INSTALL_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
		sed -i 's|^set(LLVM_CMAKE_DIR "|set(LLVM_CMAKE_DIR "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
		sed -i 's|^set(_IMPORT_PREFIX "|set(_IMPORT_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMExports.cmake
	;;
esac
