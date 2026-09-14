# dosfstools
PKG_VER=4.2
PKG_URL="https://github.com/dosfstools/dosfstools/releases/download/v${PKG_VER}/dosfstools-${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
CONF_FLAGS="--enable-compat-symlinks"
PKG_MAKETARGETS="all,install-strip"
