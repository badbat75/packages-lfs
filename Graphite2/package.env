# Graphite2
PKG_VER=1.3.14
PKG_URL="https://github.com/silnrsi/graphite/releases/download/${PKG_VER}/graphite2-${PKG_VER}.tgz"
PKG_DEPS="lfs/libpng lfs/which"
case ${PKG_TARGET} in
    bootstrap) ;;
    *) PKG_DEPS+=" lfs/HarfBuzz lfs/FreeType" ;;
esac
BUILD_PROCESS=cmakebuild
CONF_FLAGS="-DLIB_SUFFIX=${HARCH_LIB}${INSTALL_LIBSUFFIX}"
PKG_MAKETARGETS="all,install/strip"
PKG_OVERRIDELTO=0

PKG_PREBUILD="sed '/add_definitions(-mfpmath=sse -msse2)/d' -i src/CMakeLists.txt
    sed '/cmptest/d' -i tests/CMakeLists.txt"