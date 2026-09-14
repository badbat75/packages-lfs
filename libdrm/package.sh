# libdrm
PKG_VER=2.4.115
PKG_URL="https://dri.freedesktop.org/libdrm/libdrm-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/libX11 lfs/libpciaccess"
BUILD_PROCESS=mesonninja
CONF_FLAGS="-Dtests=false -Dintel=enabled"
#PKG_MAKETARGETS="all,install"
