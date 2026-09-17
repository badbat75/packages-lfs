# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The ${CMAKE_SYSROOT} inside the sed expressions is literal text for CMake, not a shell variable.

CMAKEDIR=${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/llvm
sed -i 's|^set(LLVM_INSTALL_PREFIX "|set(LLVM_INSTALL_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
sed -i 's|^set(LLVM_CMAKE_DIR "|set(LLVM_CMAKE_DIR "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
sed -i 's|^set(_IMPORT_PREFIX "|set(_IMPORT_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMExports.cmake
### The default lit of the out of tree builds is the llvm-lit of the build tree, which is not installed:
### none, they look for one themselves
sed -i 's|^set(LLVM_DEFAULT_EXTERNAL_LIT ".*")|set(LLVM_DEFAULT_EXTERNAL_LIT "")|' ${CMAKEDIR}/LLVMConfig.cmake
