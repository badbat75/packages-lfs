# binutils
PKG_URL="https://ftp.gnu.org/gnu/binutils/binutils-${BINUTILS_VER}.tar.bz2"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/libgmp lfs/libmpfr lfs/libmpc lfs/libisl"
case ${BINUTILS_VER} in
	2.43)
		PKG_VER=2.43+e2622c0a840
		PATCHES=binutils/binutils_2.43+e2622c0a840.patch
		;;
	2.42)
		PKG_VER=2.42+ef38693b8a4
		PATCHES=binutils/binutils_2.42+ef38693b8a4.patch
		;;
	2.41)
		PKG_VER=2.41+1900793bab0
		PATCHES=binutils/binutils_2.41+1900793bab0.patch
		;;
	2.40)
		PKG_VER=2.40+391fd4d9ee5
		PATCHES=binutils/binutils_2.40+391fd4d9ee5.patch
		;;
	2.39)
		PKG_VER=2.39+a648fe30735
		PATCHES=binutils/binutils_2.39+a648fe30735.patch
		;;
	*)
		PKG_VER=${BINUTILS_VER}
		;;
esac
BUILD_PROCESS=configmake
STD_CONF_FLAGS=0
# Gprof broken with with glibc 2.40
CONF_FLAGS="--prefix=${INSTALL_PREFIX} --libdir=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} --with-sysroot=/ --with-build-sysroot=\${SYSROOT} \
	 \
	--disable-werror \
	--enable-shared --enable-static \
	--enable-gold=default --enable-ld --enable-gprofng=no --enable-lto \
	--enable-new-dtags --disable-rpath --enable-threads=yes --enable-plugins --enable-64-bit-bfd \
	--enable-compressed-debug-sections=all --enable-separate-code=yes --enable-plugins"
CONF_FLAGS+=" --with-system-zlib"
CONF_FLAGS+=" --with-mpc-include=\${SYSROOT}${INSTALL_INCLUDEDIR} --with-mpc-lib=\${SYSROOT}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
CONF_FLAGS+=" --with-mpfr-include=\${SYSROOT}${INSTALL_INCLUDEDIR} --with-mpfr-lib=\${SYSROOT}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
CONF_FLAGS+=" --with-gmp-include=\${SYSROOT}${INSTALL_INCLUDEDIR} --with-gmp-lib=\${SYSROOT}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
CONF_FLAGS+=" --with-isl-include=\${SYSROOT}${INSTALL_INCLUDEDIR} --with-isl-lib=\${SYSROOT}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
PKG_MAKEVARS="STAGE_CC_WRAPPER=\"${CCWRAPPER}\""
PKG_MAKEVARS+=" AR_FOR_TARGET=\"\${AR}\""
PKG_MAKEVARS+=" NM_FOR_TARGET=\"\${NM}\""
PKG_MAKEVARS+=" RANLIB_FOR_TARGET=\"\${RANLIB}\""
PKG_TOOLCHAIN=gnu
PKG_OVERRIDELD=bfd

case ${BINUTILS_VER} in
	2.3*)
		CONF_ENV="env -u CPP -u CPPFLAGS"
		PKG_MAKEENV="env -u CPP -u CPPFLAGS"
	;;
esac

case ${PKG_TARGET} in
	native)
		CONF_FLAGS+=" --build=${BARCH} --host=${BARCH} --target=${BARCH}"
		PKG_MAKETARGETS="configure-host"
		PKG_POSTBUILD="cd bfd; make install-bfdincludeHEADERS"
		PKG_CHECK="[ -f ${INSTALL_INCLUDEDIR}/plugin-api.h ]"
		#### Need deeper analysis to get why native build breaks cross build
		#PKG_CHECK="[ \"\$( \"${INSTALL_EXECPREFIX}/bin/ld.bfd\" --version | head -n1 | awk '{print \$5}' | cut -d. -f1,2 )\" == \"${PKG_VER/\+*/}\" ]"
		#PKG_MAKETARGETS="all,install-strip-bfd,install-strip"
	;;
	cross)
		PKG_CHECK="[ \"\$( \"${INSTALL_EXECPREFIX}/bin/${HARCH}-ld.bfd\" --version | head -n1 | awk '{print \$5}' | cut -d. -f1,2 )\" == \"${PKG_VER/\+*/}\" ]"
		CONF_FLAGS+=" --build=${BARCH} --host=${BARCH} --target=${HARCH} --enable-targets=${HARCH}"
		PKG_MAKETARGETS="all,install-strip"
	;;
	*)
		CONF_FLAGS+=" --build=${BARCH} --host=${HARCH} --target=${HARCH} --enable-targets=${HARCH}"
		PKG_LDFLAGS="-s"
		PKG_MAKETARGETS="all,install"
	;;
esac

PKG_PREBUILD="sed '/^AM_CFLAGS_FOR_BUILD/ s/\\\$(ZSTD_CFLAGS)//' -i binutils/Makefile.in"