# llvm
PKG_VER=${LLVM_VER}
PKG_URL="https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/ncurses lfs/zlib lfs/xz lfs/libxml2 lfs/binutils lfs/libffi"
BUILD_PROCESS=cmakebuild
CONF_FLAGS="-S\${PKG_SRCPATH}/llvm"
CONF_FLAGS+=" -DLLVM_HOST_TRIPLE=${HARCH}"
#CONF_FLAGS+=" -DLLVM_ENABLE_PIC=False"
CONF_FLAGS+=" -DLLVM_ENABLE_FFI:BOOL=ON"
case ${PKG_OVERRIDELTO:-${LTOENABLE:-0}} in
	1|fat) CONF_FLAGS+=" -DLLVM_ENABLE_LTO=fat"
		;;
	2|thin)	CONF_FLAGS+=" -DLLVM_ENABLE_LTO=thin"
		;;
esac
CONF_FLAGS+=" -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON"
CONF_FLAGS+=" -DLLVM_LINK_LLVM_DYLIB:BOOL=ON"
CONF_FLAGS+=" -DLLVM_ENABLE_RTTI:BOOL=ON "
CONF_FLAGS+=" -DLLVM_TARGETS_TO_BUILD:STRING=\"$(
		case "${HM}" in
			aarch64) echo -n AArch64 ;;
			arm) echo -n ARM ;;
			mips) echo -n Mips ;;
			powerpc) echo -n PowerPC ;;
			riscv) echo -n RISCV ;;
			sparc) echo -n Sparc ;;
			x86_64) echo -n X86 ;;
		esac
	);AMDGPU;BPF\""
CONF_FLAGS+=" -DLLVM_BINUTILS_INCDIR:FILEPATH=\"\${SYSROOT}/usr/include\""
#if "${GLOBAL_TOOLCHAIN_PATH}/llvm-${LLVM_VER}/bin/llvm-tblgen" --version >/dev/null 2>&1
#then
#	CONF_FLAGS+=" -DLLVM_TABLEGEN:FILEPATH=${GLOBAL_TOOLCHAIN_PATH}/llvm-${LLVM_VER}/bin/llvm-tblgen"
#else
#	if llvm-tblgen --version >/dev/null 2>&1
#	then
#		CONF_FLAGS+=" -DLLVM_TABLEGEN:FILEPATH=$(which llvm-tblgen)"
#	fi
#fi
CONF_FLAGS+=" -DLLVM_LIBDIR_SUFFIX:STRING=${HARCH_LIB}${INSTALL_LIBSUFFIX}"
CONF_FLAGS+=" -DLLVM_ENABLE_PROJECTS=\"clang;libclc\""
CONF_FLAGS+=" -DLLVM_NATIVE_TOOL_DIR=${GLOBAL_TOOLCHAIN_PATH}/llvm-${LLVM_VER}/bin"
CONF_FLAGS+=" -DLIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR=${GLOBAL_TOOLCHAIN_PATH}/llvm-${LLVM_VER}/bin"
CONF_FLAGS+=" -DLLVM_INCLUDE_BENCHMARKS:BOOL=OFF"
CONF_FLAGS+=" -DLLVM_INCLUDE_TESTS:BOOL=OFF"
CONF_FLAGS+=" -DLLVM_ENABLE_BINDINGS:BOOL=OFF"
CONF_FLAGS+=" -Wno-dev"
PKG_OVERRIDESHARED=0
PKG_OVERRIDESTATIC=1
#PKG_PREBUILD="download_uncompress https://github.com/llvm/llvm-project/releases/download/llvmorg-${PKG_VER}/cmake-${PKG_VER}.src.tar.xz \${PKG_SRCPATH}/cmake-${PKG_VER}.src
#	sed '/LLVM_COMMON_CMAKE_UTILS/s@../cmake@cmake-${PKG_VER}.src@' -i CMakeLists.txt"
PKG_TOOLCHAIN=llvm

case ${PKG_TARGET} in
	native)
		PKG_MAKETARGETS="llvm-tblgen,install-llvm-tblgen-stripped"
	;;
	*)
		PKG_MAKETARGETS="install/strip"
		PKG_POSTBUILD="sed -i 's|^set(LLVM_INSTALL_PREFIX \"|set(LLVM_INSTALL_PREFIX \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/llvm/LLVMConfig.cmake
			sed -i 's|^set(LLVM_CMAKE_DIR \"|set(LLVM_CMAKE_DIR \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/llvm/LLVMConfig.cmake
			sed -i 's|^set(_IMPORT_PREFIX \"|set(_IMPORT_PREFIX \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/llvm/LLVMExports.cmake"
	;;
esac