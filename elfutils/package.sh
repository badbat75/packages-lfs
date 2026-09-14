# elfutils
PKG_VER=0.192
PKG_URL="https://sourceware.org/ftp/elfutils/${PKG_VER}/elfutils-${PKG_VER}.tar.bz2"
PKG_DEPS="lfs/bison:native lfs/flex:native"
case ${PKG_TARGET} in
    cross|native) ;;
    *)
        PKG_DEPS+=" lfs/zlib lfs/gzip lfs/bzip2 lfs/zstd lfs/xz"
        PKG_MAKEVARS="STRIPPROG=${HARCH}-strip"
    ;;
esac
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--program-prefix=eu- --disable-debuginfod --disable-werror --enable-libdebuginfod=dummy"
PKG_MAKETARGETS="all,install-strip"
case ${TOOLCHAIN} in
    gnu) PKG_CFLAGS="-Wno-stack-usage -Wno-format-nonliteral";;
    llvm) PKG_CFLAGS="-Wno-unused-parameter";;
esac
