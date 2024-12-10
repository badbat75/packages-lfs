# strace
PKG_VER=6.9
PKG_URL="https://github.com/strace/strace/releases/download/v${PKG_VER}/strace-${PKG_VER}.tar.xz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
#PKG_OVERRIDELTO=0
CONF_FLAGS="--enable-mpers=no --enable-bundled=yes"
PKG_MAKETARGETS="all,install-strip"
case ${TOOLCHAIN} in
    llvm)
        PKG_CFLAGS="-Wno-unused-function -Wno-deprecated-non-prototype"
        ;;
esac

PKG_PREBUILD="sed '/@CODE_COVERAGE_RULES@/d' -i Makefile.am"