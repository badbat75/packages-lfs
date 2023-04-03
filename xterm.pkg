# xterm
PKG_VER=379
PKG_URL="https://invisible-mirror.net/archives/xterm/xterm-${PKG_VER}.tgz"
PKG_DEPS="lfs/libXaw lfs/libXpm lfs/pcre2 lfs/dejavu-fonts-ttf lfs/dejavu-lgc-fonts-ttf"
BUILD_PROCESS=configmake
PKG_AUTOCONF=0
CONF_FLAGS="--with-app-defaults=${INSTALL_SYSCONFDIR}/X11/app-defaults"
PKG_MAKETARGETS="all,install"
PKG_LDFLAGS="-s"