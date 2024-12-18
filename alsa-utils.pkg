# alsa-utils
PKG_VER=1.2.13
PKG_URL="https://www.alsa-project.org/files/pub/utils/alsa-utils-${PKG_VER}.tar.bz2"
BUILD_PROCESS=configmake
PKG_AUTOCONF=0
PKG_DEPS="lfs/ncurses lfs/alsa-lib lfs/alsa-topology-conf"
CONF_FLAGS="--with-curses=ncursesw --with-systemdsystemunitdir=/lib/systemd/system --with-systemduserunitdir=${INSTALL_PREFIX}/lib/systemd/user --with-udev-rules-dir=/lib/udev/rules.d"
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="mkdir -pv ${PKG_BLDPATH}/include
    cp -pv \${PKG_SRCPATH}/include/os_compat.h \${PKG_BLDPATH}/include/os_compat.h
    sed -e 's/acp-pdm-dmic/acp-dmic-codec/'                   \
    -e '/LABEL=\"alsa_restore_go\"/s/go/std/'               \
    -e '/^ENV.ALSA_CARD_NUMBER/i LABEL=\"alsa_restore_go\"' \
    -i alsactl/90-alsa-restore.rules.in"