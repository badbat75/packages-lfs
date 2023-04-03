# xinit
PKG_VER=1.4.2
PKG_URL="https://www.x.org/pub/individual/app/xinit-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/libX11 lfs/xorgproto"
PKG_DEPS+=" lfs/twm lfs/xterm lfs/xclock"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--with-xinitdir=${INSTALL_SYSCONFDIR}/X11/app-defaults"
PKG_MAKETARGETS="all,install-strip"
