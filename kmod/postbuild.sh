# shellcheck shell=bash
# shellcheck disable=SC2154
# kmod: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

[ ! -d ${PKG_PKGPATH}${INSTALL_PREFIX}/sbin ] && mkdir ${PKG_PKGPATH}${INSTALL_PREFIX}/sbin || true
    for target in depmod insmod lsmod modinfo modprobe rmmod; do
        ln -sfv ../bin/kmod ${PKG_PKGPATH}${INSTALL_PREFIX}/sbin/$target
    done
	ln -sfv kmod ${PKG_PKGPATH}${INSTALL_PREFIX}/bin/lsmod
