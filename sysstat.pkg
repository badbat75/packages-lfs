# sysstat
PKG_VER=12.7.5
PKG_URL="https://github.com/sysstat/sysstat/archive/refs/tags/v${PKG_VER}.tar.gz"
PKG_AUTOCONF=1
PKG_COPYSRC=1
BUILD_PROCESS=configmake
CONF_ENV="sa_lib_dir=${INSTALL_PREFIX}/lib/sa \
    sa_dir=/var/log/sa \
    conf_dir=/etc/sysconfig"
CONF_FLAGS="--disable-file-attr"
PKG_CFLAGS="-Wno-deprecated-declarations"
#PKG_MAKETARGETS="all,install"

PKG_POSTBUILD="install -vdm755 \${PKG_PKGPATH}/lib/systemd/system
    install -v -m644 sysstat.service \${PKG_PKGPATH}/lib/systemd/system/sysstat.service
    install -v -m644 cron/sysstat-collect.service \${PKG_PKGPATH}/lib/systemd/system/sysstat-collect.service
    install -v -m644 cron/sysstat-collect.timer \${PKG_PKGPATH}/lib/systemd/system/sysstat-collect.timer
    install -v -m644 cron/sysstat-summary.service \${PKG_PKGPATH}/lib/systemd/system/sysstat-summary.service
    install -v -m644 cron/sysstat-summary.timer \${PKG_PKGPATH}/lib/systemd/system/sysstat-summary.timer
    sed -i '/^Also=/d' \${PKG_PKGPATH}/lib/systemd/system/sysstat.service"