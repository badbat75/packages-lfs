# Vulkan-SPIRV-LLVM-Translator
PKG_VER="$(echo ${LLVM_VER} | cut -d'.' -f1,2).2"
PKG_URL="https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v${PKG_VER}.tar.gz"
BUILD_PROCESS=cmakebuild
CONF_FLAGS="-DLLVM_DIR=${GLOBAL_TOOLCHAIN_PATH}/llvm-${LLVM_VER} -DCCACHE_ALLOWED:BOOL=OFF"
PKG_MAKETARGETS="all,install/strip"
case ${PKG_TARGET} in
	cross)
		PKG_DEPS=lfs/Vulkan-SPIRV-Headers:cross
	;;
	*)
		PKG_DEPS="lfs/Vulkan-SPIRV-Headers lfs/Vulkan-SPIRV-LLVM-Translator:cross"
		CONF_FLAGS+=" -DLLVM_SPIRV=${GLOBAL_TOOLCHAIN_PATH}/llvm-${LLVM_VER}/bin/llvm-spirv"
	;;
esac
#### Missing symbols during build with llvm
PKG_TOOLCHAIN=gnu
