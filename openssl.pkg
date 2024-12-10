# openssl
PKG_VER=3.4.0
PKG_URL="https://www.openssl.org/source/openssl-${PKG_VER}.tar.gz"
CONF_COPYRSC=1
CONF_CMD="Configure"
STD_CONF_FLAGS=0
CONF_FLAGS="--prefix=${INSTALL_PREFIX} --openssldir=${INSTALL_SYSCONFDIR}/ssl shared zlib-dynamic no-tests"
CONF_VARS="-DDEVRANDOM="'\"\\\"/dev/urandom\\\"\"'
BUILD_PROCESS=configmake
#PKG_MAKETARGETS="all,install"
PKG_MAKEVARS="MANSUFFIX=ssl LIBDIR=lib${HARCH_LIB}${INSTALL_LIBSUFFIX}"
case ${TOOLCHAIN} in
    llvm) PKG_CFLAGS="-std=gnu99";;
esac

case ${PKG_TARGET} in
    native)
        PKG_CHECK="[ x$(${GLOBAL_TOOLCHAIN_PATH}/bin/openssl -v 2>/dev/null | awk '{print $2}' || : ) == x${PKG_VER} ]"
    ;;
    *)
        CONF_FLAGS+=" $(
            case x${HARCH} in
            xarm-linux-*)
                echo linux-generic32 
                ;;
            *)
                echo ${HOS}-${HM}
                ;;
            esac
            )"
        PKG_DEPS="lfs/zlib"
    ;;
esac
