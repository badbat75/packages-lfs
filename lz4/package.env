# lz4
PKG_VER=1.9.4
PKG_URL="https://github.com/lz4/lz4/archive/refs/tags/v${PKG_VER}.tar.gz"
PKG_PREBUILD="sed -i 's/\$(LN_S)/\$(LN_SF)/g' programs/Makefile
    sed -i '/^export LD_LIBRARY_PATH/d' tests/Makefile"
BUILD_PROCESS=simplemake
PKG_MAKETARGETS="default,install"
PKG_MAKEVARS="PREFIX=${INSTALL_PREFIX} LIBDIR=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"