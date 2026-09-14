# llvm
PKG_VER=${LLVM_VER}
PKG_URL="https://github.com/llvm/llvm-project/releases/download/llvmorg-${PKG_VER}/compiler-rt-${PKG_VER}.src.tar.xz"
PKG_DEPS="lfs/ncurses lfs/zlib lfs/xz lfs/libxml2 lfs/binutils lfs/libffi"
BUILD_PROCESS=cmakebuild
CONF_FLAGS="-DCOMPILER_RT_INCLUDE_TESTS:BOOL=OFF"
CONF_FLAGS+=" -DCOMPILER_RT_BUILD_BUILTINS:BOOL=${COMPILER_RT_BUILD_BUILTINS}"
CONF_FLAGS+=" -DCOMPILER_RT_BUILD_LIBFUZZER:BOOL=ON"
CONF_FLAGS+=" -DCOMPILER_RT_BUILD_MEMPROF:BOOL=ON"
CONF_FLAGS+=" -DCOMPILER_RT_BUILD_PROFILE:BOOL=ON"
CONF_FLAGS+=" -DCOMPILER_RT_BUILD_SANITIZERS:BOOL=ON"
CONF_FLAGS+=" -DCOMPILER_RT_BUILD_XRAY:BOOL=ON"
CONF_FLAGS+=" -DCOMPILER_RT_DEFAULT_TARGET_ONLY:BOOL=ON"
### For ARM? ###
#CONF_FLAGS+=" -DCMAKE_SHARED_LINKER_FLAGS=-lgcc_s"
PKG_MAKETARGETS="install/strip"
PKG_OVERRIDESHARED=0
PKG_OVERRIDESTATIC=1
PKG_PREBUILD="download_uncompress https://github.com/llvm/llvm-project/releases/download/llvmorg-${PKG_VER}/cmake-${PKG_VER}.src.tar.xz \${PKG_SRCPATH}/cmake-${PKG_VER}.src
	sed '/LLVM_COMMON_CMAKE_UTILS/s@../cmake@cmake-${PKG_VER}.src@' -i CMakeLists.txt"
PKG_TOOLCHAIN=llvm