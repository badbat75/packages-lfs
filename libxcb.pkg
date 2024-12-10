# libxcb
PKG_VER=1.15
PKG_URL="https://xorg.freedesktop.org/archive/individual/lib/libxcb-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/doxygen:native lfs/libXau lfs/libXdmcp"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
case ${PKG_TARGET} in
    bootstrap)
        CONF_ENV="PYTHON=python$( echo ${PYTHON_VER} | cut -d. -f1,2 )"
        PKG_MAKEENV="PYTHONPATH=\"\${SYSROOT}${INSTALL_PREFIX}/lib/python$( echo ${PYTHON_VER} | cut -d. -f1,2 )\""
        PKG_DEPS+=" lfs/xcb-proto:bootstrap"
    ;;
    *)
        CONF_ENV="PYTHON=cross-python3"
        PKG_DEPS+=" lfs/xcb-proto"
    ;;
esac
