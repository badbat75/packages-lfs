# zlib
PKG_VER=1.3.1
PKG_URL="https://github.com/madler/zlib/releases/download/v${PKG_VER}/zlib-${PKG_VER}.tar.xz"
BUILD_PROCESS=cmakebuild
CONF_FLAGS="-DINSTALL_INC_DIR=${INSTALL_INCLUDEDIR} -DINSTALL_LIB_DIR=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} -DINSTALL_PKGCONFIG_DIR=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig"
PKG_CXXFLAGS="-D_FILE_OFFSET_BITS=64"
PKG_MAKETARGETS="all,install/strip"

case ${TOOLCHAIN} in
    llvm) PKG_CFLAGS="-Wno-deprecated-non-prototype";;
esac