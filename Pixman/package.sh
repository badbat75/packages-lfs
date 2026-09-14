# Pixman
PKG_VER=0.42.2 
PKG_URL="https://www.cairographics.org/releases/pixman-${PKG_VER}.tar.gz"
PKG_DEPS=
BUILD_PROCESS=mesonninja
CONF_FLAGS="-Dtests=disabled"
#PKG_MAKETARGETS="all,install"

case ${TOOLCHAIN} in
	llvm) PKG_CFLAGS="-fno-integrated-as" ;;
esac