# less
PKG_VER=643
PKG_URL="http://www.greenwoodsoftware.com/less/less-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/ncurses"
BUILD_PROCESS=configmake
PKG_MAKETARGETS="all,install-strip"

case ${TOOLCHAIN} in
    llvm)
        PKG_CFLAGS="-Wno-implicit-function-declaration -Wno-deprecated-non-prototype"
        ;;
esac

PKG_PREBUILD="sed -i '/\${INSTALL_PROGRAM} -s/ s/-s/--strip-program \$(STRIP) -s/'  Makefile.in"
