# Mesa
PKG_VER=24.3.1
PKG_URL="https://mesa.freedesktop.org/archive/mesa-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/libX11 lfs/libXfixes lfs/libxshmfence lfs/libXxf86vm lfs/libxcb lfs/libXrandr"
PKG_DPES+=" lfs/libdrm"
PKG_DEPS+=" lfs/wayland-protocols"
BUILD_PROCESS=mesonninja
CONF_FLAGS="-Dplatforms=x11,wayland"
CONF_FLAGS+=" -Dvalgrind=disabled"
CONF_FLAGS+=" -Dstrip=true"
#PKG_MAKETARGETS="all,install"
case ${PKG_TARGET} in
	bootstrap)
		CONF_FLAGS+=" -Dgallium-drivers=svga,softpipe,llvmpipe,virgl"
		CONF_FLAGS+=" -Dvulkan-drivers=\"\""
		CONF_FLAGS+=" -Dlibunwind=disabled"
	;;
	*)
		PKG_DEPS+=" lfs/libva"
		PKG_DEPS+=" lfs/libvdpau"
		PKG_DEPS+=" lfs/llvm"
		PKG_DEPS+=" lfs/libgcrypt"
		PKG_DEPS+=" lfs/nettle"
		PKG_DEPS+=" lfs/libunwind"
		PKG_DEPS+=" lfs/lm-sensors"
		#PKG_DEPS+=" lfs/libtizonia"
		PKG_DEPS+=" lfs/Vulkan:loader lfs/Vulkan:glslang lfs/Vulkan-SPIRV-LLVM-Translator"
		PKG_DEPS+=" python/PyYAML python/pycparser"
		CONF_ENV="LLVM_CONFIG=\${SYSROOT}${INSTALL_EXECPREFIX}/bin/llvm-config"
		CONF_FLAGS+=" -Dgallium-drivers=v3d,vc4,freedreno,etnaviv,nouveau,svga,tegra,virgl,lima,panfrost,softpipe,llvmpipe,zink"
		CONF_FLAGS+=" -Dvulkan-drivers=auto"
		PKG_MAKEENV="sed 's,-isystem/usr/include ,,g' -i build.ninja;"
	;;
esac

PKG_PREBUILD="sed -e '/#include <sstream>/a #include <limits>' -i src/gallium/drivers/r600/sfn/sfn_valuefactory.cpp"