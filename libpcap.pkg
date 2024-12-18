# libpcap
PKG_VER=1.10.5
PKG_URL="https://www.tcpdump.org/release/libpcap-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/systemd:bootstrap lfs/D-Bus lfs/libnl"
BUILD_PROCESS=cmakebuild
PKG_MAKETARGETS="all,install/strip"
PKG_OVERRIDELTO=0

PKG_POSTBUILD="mv -v \${PKG_PKGPATH}${INSTALL_PREFIX}/lib/pkgconfig \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"