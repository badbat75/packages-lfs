# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target llvm-libs: the install is only the libraries Mesa links (the PKG_MAKETARGETS of
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
### LLVMExports-release.cmake checks that the file of every imported target exists, the tools
### too (llvm-tblgen, opt, llc...), which this flavor does not install: find_package(LLVM) in the
### sysroot stopped on the first one (lfs/Vulkan-SPIRV-LLVM-Translator). The check goes for the
### targets whose file is not in the staging directory; their definitions stay
EXPORTS=${CMAKEDIR}/LLVMExports-release.cmake
sed -n 's|^list(APPEND _cmake_import_check_files_for_\([^ ]*\) "${_IMPORT_PREFIX}\([^"]*\)" )$|\1 \2|p' "${EXPORTS}" |
	while read -r TARGET FILE
	do
		if [ ! -e "${PKG_PKGPATH}${INSTALL_PREFIX}${FILE}" ]
		then
			printf '/^list(APPEND _cmake_import_check_targets %s )$/d\n' "${TARGET}"
			printf '/^list(APPEND _cmake_import_check_files_for_%s /d\n' "${TARGET}"
		fi
	done > "${PKG_BLDPATH}/exports-prune.sed"
sed -i -f "${PKG_BLDPATH}/exports-prune.sed" "${EXPORTS}"
