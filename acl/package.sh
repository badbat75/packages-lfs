# acl
PKG_VER=2.3.2
PKG_URL="http://download.savannah.gnu.org/releases/acl/acl-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/attr"
PKG_AUTOCONF=1
BUILD_PROCESS=configmake
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
