# Vulkan-SPIRV-Headers
PKG_VER=1.3.296.0
PKG_URL="https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/vulkan-sdk-${PKG_VER}.tar.gz"
BUILD_PROCESS=cmakebuild
case ${PKG_TARGET} in
	cross)
		CONF_FLAGS=""
		PKG_MAKETARGETS="all,install/strip"
	;;
	*)
		CONF_FLAGS=""
		PKG_MAKETARGETS="all,install/strip"
	;;
esac
