# readline
PKG_VER=8.2
PKG_URL="https://ftp.gnu.org/gnu/readline/readline-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/ncurses"
PATCHES="https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b"
BUILD_PROCESS=configmake
CONF_FLAGS="--with-curses --with-shared-termcap-library --docdir=/usr/share/doc/readline-${PKG_VER}"
PKG_POSTBUILD="install -v -m644 \${PKG_SRCPATH}/doc/*.{ps,pdf,html,dvi} \${PKG_PKGPATH}/usr/share/doc/readline-${PKG_VER}"
