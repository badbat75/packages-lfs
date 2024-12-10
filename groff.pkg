# groff
PKG_VER=1.23.0
PKG_URL="http://ftp.gnu.org/gnu/groff/groff-${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="PAGE=A4"
PKG_MAKETARGETS="all,install-strip"
case ${PKG_TARGET} in
    cross|native)
        PKG_CHECK="[ x\$( ${INSTALL_EXECPREFIX}/bin/groff -V | awk 'NR==1{print \$4}' || true ) == x${PKG_VER} ]"
    ;;
    *)
        PKG_DEPS="lfs/groff:cross"
        PKG_MAKEVARS="GROFFBIN=${TOOLCHAIN_PATH}/bin/groff GROFF_BIN_PATH=${TOOLCHAIN_PATH}/bin"
    ;;
esac

PKG_PREBUILD="sed -i '/^AR=ar/ s/ar/@AR@/' Makefile.am"

case ${TOOLCHAIN} in
    llvm) PKG_CXXFLAGS="-Wno-register" ;;
esac