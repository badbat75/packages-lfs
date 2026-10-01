# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The ${CMAKE_SYSROOT} inside the sed expressions is literal text for CMake, not a shell variable.

CMAKEDIR=${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/llvm
sed -i 's|^set(LLVM_INSTALL_PREFIX "|set(LLVM_INSTALL_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
sed -i 's|^set(LLVM_CMAKE_DIR "|set(LLVM_CMAKE_DIR "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
### Every other directory of the config with an absolute path (the include directories, which a
### standalone build such as lldb compiles with)
sed -i 's|^set(\(LLVM_[A-Z_]*\) "/|set(\1 "${CMAKE_SYSROOT}/|' ${CMAKEDIR}/LLVMConfig.cmake
sed -i 's|^set(_IMPORT_PREFIX "|set(_IMPORT_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMExports.cmake
### The default lit of the out of tree builds is the llvm-lit of the build tree, which is not installed:
### none, they look for one themselves
sed -i 's|^set(LLVM_DEFAULT_EXTERNAL_LIT ".*")|set(LLVM_DEFAULT_EXTERNAL_LIT "")|' ${CMAKEDIR}/LLVMConfig.cmake
### The same for clang (the standalone build of lldb, lfs/llvm:lldb): its config, the LLVM it looks for,
### its targets
CLANG_CMAKEDIR=${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/clang
sed -i -e 's|^set(CLANG_INSTALL_PREFIX "|set(CLANG_INSTALL_PREFIX "${CMAKE_SYSROOT}|' \
	-e 's|^set(CLANG_CMAKE_DIR "|set(CLANG_CMAKE_DIR "${CMAKE_SYSROOT}|' \
	-e 's|^set(CLANG_INCLUDE_DIRS "|set(CLANG_INCLUDE_DIRS "${CMAKE_SYSROOT}|' \
	-e 's|^\(\s*HINTS \)"|\1"${CMAKE_SYSROOT}|' ${CLANG_CMAKEDIR}/ClangConfig.cmake
sed -i 's|^set(_IMPORT_PREFIX "|set(_IMPORT_PREFIX "${CMAKE_SYSROOT}|' ${CLANG_CMAKEDIR}/ClangTargets.cmake
