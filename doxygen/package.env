# doxygen
PKG_VER=1.11.0
PKG_URL="https://doxygen.nl/files/doxygen-${PKG_VER}.src.tar.gz"
PKG_DEPS="lfs/bison:native lfs/flex:native"
BUILD_PROCESS=cmakebuild
CMAKE_GENERATOR="Unix Makefiles"
CONF_FLAGS="-Dbuild_doc=OFF -Wno-dev"
PKG_MAKETARGETS="all,install/strip"
PKG_POSTBUILD="mkdir -pv \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
    cp -fPv lib/libspdlog.so* \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"

case ${PKG_TARGET} in
    native)
        PKG_CHECK="[ x$(${GLOBAL_TOOLCHAIN_PATH}/bin/doxygen --version 2>/dev/null || :) == x${PKG_VER} ]"
    ;;
esac
