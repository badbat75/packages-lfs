# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target libs: the install is only the libraries Mesa links (the PKG_MAKETARGETS of
# the package.env of this variant: llvm-config, the LLVM libraries with the libLLVM dylib,
# the clang libraries (libclang-cpp.so, which meson finds and Mesa links, and the static
# ones) and the cmake config; the headers are lfs/llvm:headers). Replaces the postbuild of
# target/sysroot, whose sed work is done here as well.

CMAKEDIR=${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/llvm
sed -i 's|^set(LLVM_INSTALL_PREFIX "|set(LLVM_INSTALL_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
sed -i 's|^set(LLVM_CMAKE_DIR "|set(LLVM_CMAKE_DIR "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMConfig.cmake
sed -i 's|^set(_IMPORT_PREFIX "|set(_IMPORT_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/LLVMExports.cmake
### The default lit of the out of tree builds is the llvm-lit of the build tree, which is not installed:
### none, they look for one themselves
sed -i 's|^set(LLVM_DEFAULT_EXTERNAL_LIT ".*")|set(LLVM_DEFAULT_EXTERNAL_LIT "")|' ${CMAKEDIR}/LLVMConfig.cmake
