# libepoxy
PKG_VER=1.5.10
PKG_URL="https://download.gnome.org/sources/libepoxy/$(echo ${PKG_VER} | cut -d. -f1,2)/libepoxy-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/Mesa"
BUILD_PROCESS=mesonninja
CONF_FLAGS=
#PKG_MAKETARGETS="all,install"
