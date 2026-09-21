# shellcheck shell=bash
# shellcheck disable=SC2154
# zram-swap: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -d -m755 ${PKG_PKGPATH}${INSTALL_PREFIX}/libexec/zram-swap \
	${PKG_PKGPATH}/lib/systemd/system \
	${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/default
install -v -m755 ${PKG_RECIPEPATH}/files/zram-swap.sh ${PKG_PKGPATH}${INSTALL_PREFIX}/libexec/zram-swap/zram-swap.sh
install -v -m644 ${PKG_RECIPEPATH}/files/zram-swap.service ${PKG_PKGPATH}/lib/systemd/system/zram-swap.service
install -v -m644 ${PKG_RECIPEPATH}/files/zram-swap.conf ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/default/zram-swap
