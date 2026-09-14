# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm-compiler-rt: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

download_uncompress https://github.com/llvm/llvm-project/releases/download/llvmorg-${PKG_VER}/cmake-${PKG_VER}.src.tar.xz ${PKG_SRCPATH}/cmake-${PKG_VER}.src
	sed '/LLVM_COMMON_CMAKE_UTILS/s@../cmake@cmake-${PKG_VER}.src@' -i CMakeLists.txt
