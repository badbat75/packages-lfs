# Poppler
PKG_VER=23.05.0
PKG_URL="https://poppler.freedesktop.org/poppler-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/zlib"
PKG_DEPS+=" lfs/fontconfig"
PKG_DEPS+=" lfs/gobject-introspection"
PKG_DEPS+=" lfs/boost"
PKG_DEPS+=" lfs/Cairo:bootstrap"
PKG_DEPS+=" lfs/LittleCMS"
PKG_DEPS+=" lfs/libjpeg-turbo"
PKG_DEPS+=" lfs/libpng"
PKG_DEPS+=" lfs/nss"
PKG_DEPS+=" lfs/OpenJPEG"
PKG_DEPS+=" lfs/curl"
PKG_DEPS+=" lfs/gdk-pixbuf"
#PKG_DEPS+=" lfs/GTK+"
#PKG_DEPS+=" lfs/GTK-Doc"
PKG_DEPS+=" lfs/libtiff"
#PKG_DEPS+=" lfs/libQt"
PKG_DEPS+=" lfs/curl"

BUILD_PROCESS=cmakebuild
CONF_FLAGS="-DENABLE_UNSTABLE_API_ABI_HEADERS=ON -DGLIB2_MKENUMS_PYTHON=\$(which cross-python3)"
CONF_FLAGS+=" -DOPENJPEG_PREFIX=\${SYSROOT}${INSTALL_PREFIX}"
CONF_FLAGS+=" -DCURL_LIBRARY=\${SYSROOT}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libcurl.so"
#PKG_MAKETARGETS="all,install"

case ${TOOLCHAIN} in
    llvm)
        PKG_MAKEENV="LD_LIBRARY_PATH=$(llvm-config --libdir):\${SYSROOT}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
    ;;
    gnu)
        PKG_MAKEENV="LD_LIBRARY_PATH=\${SYSROOT}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
    ;;
esac
