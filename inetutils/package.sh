# inetutils
PKG_VER=2.5
PKG_URL="http://ftp.gnu.org/gnu/inetutils/inetutils-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/ncurses lfs/readline"
BUILD_PROCESS=configmake
CONF_FLAGS="--disable-logger --disable-whois --disable-rcp --disable-rexec --disable-rlogin --disable-rsh --disable-servers \
    --with-path-procnet-dev=/proc/net/dev"
PKG_MAKETARGETS="all,install-strip"
