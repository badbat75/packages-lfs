# libxcrypt
PKG_VER=4.4.36
PKG_URL="https://github.com/besser82/libxcrypt/archive/v${PKG_VER}.tar.gz"
PKG_AUTOCONF=1
BUILD_PROCESS=configmake
PKG_OVERRIDELTO=0

case ${PKG_TARGET} in
	headers)
		CONF_FLAGS="--disable-werror --disable-failure-tokens --disable-valgrind \
		--enable-hashes=all --enable-obsolete-api=glibc --enable-obsolete-api-enosys=yes"
		PKG_MAKETARGETS="install-nodist_includeHEADERS"
	;;
	compat)
		CONF_FLAGS="--disable-werror --disable-failure-tokens --disable-valgrind \
		--enable-hashes=all --enable-obsolete-api=glibc --enable-obsolete-api-enosys=yes"
		;;
	*)	
		CONF_FLAGS="--disable-werror --disable-failure-tokens --disable-valgrind \
		--enable-hashes=all --enable-obsolete-api=no --enable-obsolete-api-enosys=no"
		PKG_MAKETARGETS="all,install-strip"
	;;
esac
