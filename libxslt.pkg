# libxslt
PKG_VER=1.1.38
PKG_URL="https://gitlab.gnome.org/GNOME/libxslt/-/archive/v${PKG_VER}/libxslt-v${PKG_VER}.tar.bz2"
PKG_DEPS="lfs/libxml2"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--without-crypto"
PKG_MAKETARGETS="all,install-strip"
PKG_PREBUILD="sed -i s/3000/5000/ libxslt/transform.c doc/xsltproc.{1,xml}"
#PATCHDEB=""
