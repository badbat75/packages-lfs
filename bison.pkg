# bison
PKG_VER=3.8.2
PKG_URL="https://ftp.gnu.org/gnu/bison/bison-${PKG_VER}.tar.xz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--docdir=${INSTALL_SHAREDIR}/doc/bison-${PKG_VER}"
PKG_MAKETARGETS="all,install-strip"

case "${PKG_TARGET}" in 
    native|cross)
        PKG_CHECK="[ x\$( ${INSTALL_EXECPREFIX}/bin/bison -V | awk 'NR==1{print \$4}' || true ) == x${PKG_VER} ]"
    ;;
esac