# procps-ng
PKG_VER=4.0.4
PKG_URL="https://gitlab.com/procps-ng/procps/-/archive/v${PKG_VER}/procps-v${PKG_VER}.tar.bz2"
PKG_DEPS="lfs/ncurses lfs/systemd:bootstrap"
BUILD_PROCESS=configmake
PKG_AUTOCONF=0
CONF_FLAGS="--docdir=${INSTALL_SHAREDIR}/doc/procps-ng-${PKG_VER} --with-systemd --disable-kill --enable-watch8bit --enable-skill --enable-sigwinch --disable-modern-top --enable-pidwait"
CONF_VARS="ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes"
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed 's@ncursesw/ncurses.h@ncurses.h@' -i src/watch.c
    ./autogen.sh"