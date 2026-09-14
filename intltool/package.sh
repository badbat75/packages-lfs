# intltool
PKG_VER=0.51.0
PKG_URL="https://launchpad.net/intltool/trunk/${PKG_VER}/+download/intltool-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/perl5"
BUILD_PROCESS=configmake
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
