# gdbm
PKG_VER=1.23
PKG_URL="http://ftp.gnu.org/gnu/gdbm/gdbm-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/ncurses lfs/readline"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--enable-libgdbm-compat"
PKG_MAKETARGETS="all,install-strip"