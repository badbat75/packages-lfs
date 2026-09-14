# mkfontscale
PKG_VER=1.2.3
PKG_URL="https://gitlab.freedesktop.org/xorg/app/mkfontscale/-/archive/mkfontscale-${PKG_VER}/mkfontscale-mkfontscale-${PKG_VER}.tar.gz"
PKG_DEPS=lfs/util-macros lfs/libfontenc
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
