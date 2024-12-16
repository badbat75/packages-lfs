# kmod
PKG_VER=33
PKG_URL="https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/openssl lfs/zlib lfs/zstd lfs/xz"
#PKG_DEPS="lfs/scdoc:native"
BUILD_PROCESS=configmake
CONF_FLAGS="--with-openssl --with-xz --with-zstd --with-zlib --disable-manpages"
PKG_MAKETARGETS="all,install-strip"

PKG_POSTBUILD="[ ! -d \${PKG_PKGPATH}${INSTALL_PREFIX}/sbin ] && mkdir \${PKG_PKGPATH}${INSTALL_PREFIX}/sbin || true
    for target in depmod insmod lsmod modinfo modprobe rmmod; do
        ln -sfv ../bin/kmod \${PKG_PKGPATH}${INSTALL_PREFIX}/sbin/\$target
    done
	ln -sfv kmod \${PKG_PKGPATH}${INSTALL_PREFIX}/bin/lsmod"
