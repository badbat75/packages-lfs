# LittleCMS
PKG_VER=2.15
PKG_URL="https://github.com/mm2/Little-CMS/releases/download/lcms${PKG_VER}/lcms2-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/libjpeg-turbo lfs/libtiff"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed '/BufferSize < TagSize/,+1 s/goto Error/TagSize = BufferSize/' -i src/cmsio0.c"