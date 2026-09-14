# libspectre
PKG_VER=0.2.12
PKG_URL="http://libspectre.freedesktop.org/releases/libspectre-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/ghostscript"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
PKG_MAKETARGETS=",install"

PKG_COPYSRC=1