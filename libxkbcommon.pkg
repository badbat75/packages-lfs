# libxkbcommon
PKG_VER=1.5.0
PKG_URL="https://xkbcommon.org/download/libxkbcommon-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/doxygen:native lfs/xkeyboard-config lfs/libxcb"
#PKG_DEPS+=" lfs/Wayland lfs/waylandprotocols"
BUILD_PROCESS=mesonninja
CONF_FLAGS="-Denable-wayland=false"
CONF_FLAGS+=" -Dxkb-config-extra-path=${INSTALL_SHAREDIR}/X11/xkb"
#PKG_MAKETARGETS="all,install"
