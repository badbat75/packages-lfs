# libseccomp
PKG_VER=2.5.4
PKG_URL="https://github.com/seccomp/libseccomp/releases/download/v${PKG_VER}/libseccomp-${PKG_VER}.tar.gz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed '/@CODE_COVERAGE_RULES@/d' -i Makefile.am"

# Dependencies:

