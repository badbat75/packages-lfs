# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target libllvm: the full default build, with the install reduced to what Mesa links:
# llvm-config, the libLLVM dylib, the static clang libraries (meson looks for libclang-cpp.so,
# not built, and falls back to them), the LLVM and clang headers and the cmake config.
# Replaces the postbuild of target/sysroot, whose sed work is done here as well.

### Everything of the install that Mesa does not link goes
find "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin" -mindepth 1 ! -name llvm-config -exec rm -rf {} +
find "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}" -maxdepth 1 -name '*.a' ! -name 'libclang*' -exec rm -f {} +
rm -rf "${PKG_PKGPATH}${INSTALL_SHAREDIR}"

CMAKEDIR=${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/llvm
sed -i 's|^set(LLVM_INSTALL_PREFIX "|set(LLVM_INSTALL_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
sed -i 's|^set(LLVM_CMAKE_DIR "|set(LLVM_CMAKE_DIR "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
sed -i 's|^set(_IMPORT_PREFIX "|set(_IMPORT_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMExports.cmake
### The default lit of the out of tree builds is the llvm-lit of the build tree, which is not installed:
### none, they look for one themselves
sed -i 's|^set(LLVM_DEFAULT_EXTERNAL_LIT ".*")|set(LLVM_DEFAULT_EXTERNAL_LIT "")|' ${CMAKEDIR}/LLVMConfig.cmake
