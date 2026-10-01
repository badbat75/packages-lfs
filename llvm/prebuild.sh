# shellcheck shell=bash
# shellcheck disable=SC2154
# Sourced by runprebuild.sh: cwd is PKG_SRCPATH, set -x without -e

### llvm-config keeps the source and the build directory of the host (LLVM_SRC_ROOT and LLVM_OBJ_ROOT
### of BuildVariables.inc), and reads them only to tell a build tree from an installed prefix: the
### installed program finds its own prefix from its path, so the two names are dead weight in the image
sed -e '/^set(LLVM_SRC_ROOT /s@.*@set(LLVM_SRC_ROOT "")@' \
	-e '/^set(LLVM_OBJ_ROOT /s@.*@set(LLVM_OBJ_ROOT "")@' \
	-i llvm/tools/llvm-config/CMakeLists.txt
### The standalone build of lldb finds the resource directory of clang three directories above the cmake
### directory of clang (lib/cmake/clang): the one of the image is lib/<triple>/cmake/clang. The prefix
### clang installed into instead, which its ClangConfig.cmake gives (in the sysroot for the image)
sed -e 's@PREFIX "${Clang_DIR}/../../../"@PREFIX "${CLANG_INSTALL_PREFIX}"@' \
	-i lldb/cmake/modules/LLDBStandalone.cmake
### The libpython lldb loads when none is loaded yet is the one of the build, the sysroot for a cross
### build: the path of the image instead (Config.h of lldb, compiled into liblldb)
grep -q 'BBXB: the libpython of the image' lldb/cmake/modules/LLDBConfig.cmake || \
	sed -e '/get_target_property(_Python3_LIB_PATH Python3::Python IMPORTED_LOCATION)/a\
    if(CMAKE_SYSROOT) # BBXB: the libpython of the image\
      string(REPLACE "${CMAKE_SYSROOT}" "" _Python3_LIB_PATH "${_Python3_LIB_PATH}")\
    endif()' -i lldb/cmake/modules/LLDBConfig.cmake
