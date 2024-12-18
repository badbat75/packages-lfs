# libtiff
PKG_VER=4.7.0 
PKG_URL="https://download.osgeo.org/libtiff/tiff-${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--with-docdir=${INSTALL_SHAREDIR}/doc/libtiff-${PKG_VER}"
#PKG_MAKETARGETS="all,install-strip"

case ${PKG_TARGET} in
    bootstrap) ;;
    *)
        PKG_DEPS="lfs/Freeglut"
        PKG_DEPS+=" lfs/libjpeg-turbo"
        PKG_DEPS+=" lfs/libwebp"
        #PKG_DEPS+=" lfs/JBIG-KIT"
        #PKG_DEPS+=" lfs/LERC"
    ;;
esac
