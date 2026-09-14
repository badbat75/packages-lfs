# util-linux
PKG_VER=2.40.2
PKG_URL="https://github.com/util-linux/util-linux/archive/refs/tags/v${PKG_VER}.tar.gz"
PKG_DEPS="lfs/bison:native lfs/gettext:cross"
BUILD_PROCESS=configmake
#PKG_AUTOCONF=1
PKG_PREBUILD="po/update-potfiles; autoreconf -fi"
CONF_FLAGS="ADJTIME_PATH=/var/lib/hwclock/adjtime \
            --with-systemdsystemunitdir=/lib/systemd/system \
            --disable-chfn-chsh \
            --disable-login \
            --disable-nologin \
            --disable-su \
            --disable-setpriv \
            --disable-runuser \
            --disable-pylibmount \
            --disable-makeinstall-chown \
            --without-tinfo"
CONF_VARS="ADJTIME_PATH=/var/lib/hwclock/adjtime runstatedir=/run"
PKG_MAKEVARS="NCURSES_LIBS=-lncurses"

case ${TOOLCHAIN} in
    gnu)
        PKG_CFLAGS=" -Wno-redundant-decls"
        ;;
    llvm)
        PKG_CFLAGS=" -Wno-implicit-function-declaration"
        ;;
esac

case ${PKG_TARGET} in
    cross)
        CONF_FLAGS=" --disable-liblastlog2"
        PKG_MAKETARGETS="libuuid.la,libblkid.la,install-nodist_blkidincHEADERS,install-uuidincHEADERS"
        PKG_SKIPINSTALL=1
        PKG_POSTBUILD="install -vdm755 ${TOOLCHAIN_PATH}/lib
            install -vm755 .libs/{libuuid.so,libblkid.so} ${TOOLCHAIN_PATH}/lib"
    ;;
    *)
        if [ ${HARCH_BITWIDTH} = 32 ]
        then
            CONF_FLAGS+=" --disable-year2038"
        fi
        PKG_DEPS+=" lfs/zlib lfs/bzip2 lfs/ncurses lfs/readline lfs/SQLite"
        PKG_DEPS+=" lfs/util-linux:cross"
        INST_CMD="install-strip"
    ;;
esac

#PKG_TOOLCHAIN=gnu