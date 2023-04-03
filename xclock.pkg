# xclock
PKG_VER=1.1.1
PKG_URL="https://www.x.org/pub/individual/app/xclock-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/libXaw lfs/libXmu lfs/libX11 lfs/xorgproto lfs/libXft lfs/libxkbfile lfs/libXt"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--with-app-defaults=${INSTALL_SYSCONFDIR}/X11/app-defaults"
PKG_MAKETARGETS="all,install"
PKG_LDFLAGS="-s"