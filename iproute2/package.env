# iproute2
PKG_VER=6.9.0
PKG_URL="https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/elfutils lfs/libmnl"
PKG_CFLAGS="-fpic -fPIC -D_FILE_OFFSET_BITS=64"
#PKG_LDFLAGS=
BUILD_PROCESS=simplemake
PKG_MAKEVARS="HOSTCC=gcc"
#PKG_MAKETARGETS="all,install"
PKG_CFLAGS="-DHAVE_HANDLE_AT=1 -DHAVE_SETNS=1"
PKG_PREBUILD="sed -i /ARPD/d Makefile
	sed -i '/^CC :=/ s/:=/?=/' Makefile
	rm -fv man/man8/arpd.8
	sed -i 's/.m_ipt.o//' tc/Makefile"