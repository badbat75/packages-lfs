# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target compiler-rt: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

if [ ! -f "${PKG_SRCPATH}/compiler-rt/CMakeLists.txt" ]
then
	echo "${PKG_SRCPATH}/compiler-rt not found: the sources of lfs/llvm are gone, rebuild it with build --force" >&2
	exit 1
fi

### Built for the target with the clang of the platform toolchain, whose configuration file carries the
### sysroot, the source path maps and the directories of the cross gcc (setup_clang_config): away from
### the flags of environment.source, which are the ones of the build machine
unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
LLVM_NATIVE_PATH="${GLOBAL_TOOLCHAIN_PATH}/llvm-${LLVM_VER}"
CLANG="${TOOLCHAIN_PATH}/llvm-${LLVM_VER}/bin/${HARCH}-clang"
RESOURCE_DIR=$( "${LLVM_NATIVE_PATH}/bin/clang" -print-resource-dir )
### The normalized triple: the directory clang looks the runtime up in, and the target compiler-rt asks
### for when it builds one target only
TRIPLE=$( "${LLVM_NATIVE_PATH}/bin/clang" --target="${HARCH}" -dumpmachine )
"${GLOBAL_TOOLCHAIN_PATH}/bin/cmake" -S "${PKG_SRCPATH}/compiler-rt" -B "${PKG_BLDPATH}/bbxb-compiler-rt" -G Ninja \
	-W no-dev \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_MAKE_PROGRAM="${GLOBAL_TOOLCHAIN_PATH}/bin/ninja" \
	-DCMAKE_SYSTEM_NAME=Linux \
	-DCMAKE_SYSTEM_PROCESSOR="${HM}" \
	-DCMAKE_C_COMPILER="${CLANG}" \
	-DCMAKE_CXX_COMPILER="${CLANG}++" \
	-DCMAKE_ASM_COMPILER="${CLANG}" \
	-DCMAKE_C_COMPILER_TARGET="${TRIPLE}" \
	-DCMAKE_CXX_COMPILER_TARGET="${TRIPLE}" \
	-DCMAKE_ASM_COMPILER_TARGET="${TRIPLE}" \
	-DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
	-DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld" \
	-DCMAKE_MODULE_LINKER_FLAGS="-fuse-ld=lld" \
	-DCMAKE_AR="${TOOLCHAIN_PATH}/bin/${HARCH}-ar" \
	-DCMAKE_NM="${TOOLCHAIN_PATH}/bin/${HARCH}-nm" \
	-DCMAKE_RANLIB="${TOOLCHAIN_PATH}/bin/${HARCH}-ranlib" \
	-DLLVM_CMAKE_DIR="${PKG_SRCPATH}/llvm/cmake/modules" \
	-DCOMPILER_RT_INSTALL_PATH="${RESOURCE_DIR}" \
	-DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR:BOOL=ON \
	-DCOMPILER_RT_DEFAULT_TARGET_ONLY:BOOL=ON \
	-DCOMPILER_RT_BUILD_BUILTINS:BOOL=OFF \
	-DCOMPILER_RT_BUILD_PROFILE:BOOL=ON \
	-DCOMPILER_RT_BUILD_SANITIZERS:BOOL=OFF \
	-DCOMPILER_RT_BUILD_MEMPROF:BOOL=OFF \
	-DCOMPILER_RT_BUILD_LIBFUZZER:BOOL=OFF \
	-DCOMPILER_RT_BUILD_XRAY:BOOL=OFF \
	-DCOMPILER_RT_BUILD_ORC:BOOL=OFF \
	-DCOMPILER_RT_BUILD_CTX_PROFILE:BOOL=OFF \
	-DCOMPILER_RT_INCLUDE_TESTS:BOOL=OFF
"${GLOBAL_TOOLCHAIN_PATH}/bin/ninja" -C "${PKG_BLDPATH}/bbxb-compiler-rt" -j"${NPROCS}" install
