# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target native: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### clang-tidy-confusable-chars-gen, a program of the build the cross builds of lfs/llvm find in
### LLVM_NATIVE_TOOL_DIR, is not installed: the NATIVE subbuild would make it with the libraries of
### the build host
install -vm755 bin/clang-tidy-confusable-chars-gen "${INSTALL_EXECPREFIX}/bin/"
### LLVMConfig.cmake finds the libraries again in every build that imports it: in the global toolchain,
### as zlib (ZLIB_ROOT), not on the build host
sed -E -i "s#^(  )find_package\((zstd|LibXml2|LibEdit|FFI)\)\$#\1set(\2_ROOT ${GLOBAL_TOOLCHAIN_PATH})\n&#" \
	"${INSTALL_LIBDIR}/cmake/llvm/LLVMConfig.cmake"
