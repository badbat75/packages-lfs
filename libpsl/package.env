# libpsl
PKG_VER=0.21.2
PKG_URL="https://github.com/rockdaboot/libpsl/releases/download/${PKG_VER}/libpsl-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/libidn2"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_ENVS="PYTHON=cross-python3"
CONF_FLAGS=
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed -i 's/env python/&3/' src/psl-make-dafsa"
