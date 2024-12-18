# Vulkan
PKG_VER=1.3.296.0
BUILD_PROCESS=cmakebuild
case ${PKG_TARGET} in
	headers)
		PKG_URL="https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/vulkan-sdk-${PKG_VER}.tar.gz"
		PKG_MAKETARGETS=install
	;;
	loader)
		PKG_URL="https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/vulkan-sdk-${PKG_VER}.tar.gz"
		PKG_DEPS="lfs/Vulkan:headers"
		PKG_DEPS+=" lfs/libxcb"
		PKG_MAKETARGETS="all,install/strip"
	;;
	glslang)
		PKG_URL="https://github.com/KhronosGroup/glslang/archive/refs/tags/vulkan-sdk-${PKG_VER}.tar.gz"
		PKG_DEPS="lfs/Vulkan:cross lfs/Vulkan-SPIRV-Tools"
		CONF_FLAGS="-DALLOW_EXTERNAL_SPIRV_TOOLS=True -DPYTHON_EXECUTABLE:FILEPATH=cross-python3"
		PKG_MAKETARGETS="all,install/strip"
	;;
	cross)
		PKG_URL="https://github.com/KhronosGroup/glslang/archive/refs/tags/vulkan-sdk-${PKG_VER}.tar.gz"
		PKG_DEPS=lfs/Vulkan-SPIRV-Tools:cross
		CONF_FLAGS="-DALLOW_EXTERNAL_SPIRV_TOOLS=True"
		PKG_MAKETARGETS="all,install/strip"
	;;
esac
