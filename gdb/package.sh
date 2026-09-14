# gdb
GDB_VER=${GDB_VER:-13.1}
PKG_URL="http://ftp.gnu.org/gnu/gdb/gdb-${GDB_VER}.tar.xz"
PKG_DEPS="lfs/libgmp lfs/libmpfr lfs/libmpc"
case ${GDB_VER} in
	14.2)
		PKG_VER=14.2+b74fd1875e2
		PATCHES=gdb/gdb_14.2+b74fd1875e2.patch
		;;
	13.2)
		PKG_VER=13.2+c987953c102
		PATCHES=gdb/gdb_13.2+c987953c102.patch
		;;
	12.1)
		PKG_VER=12.1+a4418a9c6f9
		PATCHES=gdb/gdb_12.1+a4418a9c6f9.patch
		;;
	*)
		PKG_VER=${GDB_VER}
		;;
esac
BUILD_PROCESS=configmake
STD_CONF_FLAGS=0
CONF_ENV="env -u CPP -u CPPFLAGS"
CONF_FLAGS="--prefix=${INSTALL_PREFIX} --libdir=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} --with-sysroot=/ --with-build-sysroot=${SYSROOT} \
    --build=${BARCH} --host=${HARCH} --target=${HARCH} \
    --enable-shared --enable-static \
    --with-system-zlib --with-system-readline --disable-install-libbfd \
    --with-mpc-include=\${SYSROOT}\${INSTALL_INCLUDEDIR} --with-mpc-lib=\${SYSROOT}\${INSTALL_LIBDIR}\${INSTALL_LIBSUFFIX} \
    --with-mpfr-include=\${SYSROOT}\${INSTALL_INCLUDEDIR} --with-mpfr-lib=\${SYSROOT}\${INSTALL_LIBDIR}\${INSTALL_LIBSUFFIX} \
    --with-gmp-include=\${SYSROOT}\${INSTALL_INCLUDEDIR} --with-gmp-lib=\${SYSROOT}\${INSTALL_LIBDIR}\${INSTALL_LIBSUFFIX} \
    --enable-static"
# --with-python=\$(which python3)
if [ "${LTOENABLE:-0}" != "0" ]
then
    PKG_CXXFLAGS="-fno-strict-aliasing"
fi
PKG_MAKEENV="env -u CPP -u CPPFLAGS"
PKG_MAKEVARS="STAGE_CC_WRAPPER=\"${CCWRAPPER}\" \
    CFLAGS_FOR_TARGET=\"\${CFLAGS} -fno-lto\" \
    CXXFLAGS_FOR_TARGET=\"\${CXXFLAGS} -fno-lto\" \
    AR_FOR_TARGET=\"\${AR}\" \
	NM_FOR_TARGET=\"\${NM}\" \
	RANLIB_FOR_TARGET=\"\${RANLIB}\" \
"
PKG_TOOLCHAIN=gnu
PKG_MAKETARGETS="all,-C gdb install-strip,-C gdbserver install-strip"

case ${GDB_VER} in
    12.*)
        PKG_PREBUILD="sed -i '/return/s/rl.*characters/(char *) &/' gdb/completer.c"
    ;;
esac
