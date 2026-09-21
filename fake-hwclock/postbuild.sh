# shellcheck shell=bash
# shellcheck disable=SC2154
# fake-hwclock: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -d -m755 ${PKG_PKGPATH}${INSTALL_PREFIX}/libexec/fake-hwclock ${PKG_PKGPATH}/lib/systemd/system
install -v -m755 ${PKG_RECIPEPATH}/files/fake-hwclock.sh ${PKG_PKGPATH}${INSTALL_PREFIX}/libexec/fake-hwclock/fake-hwclock.sh
install -v -m644 ${PKG_RECIPEPATH}/files/fake-hwclock.service ${PKG_PKGPATH}/lib/systemd/system/fake-hwclock.service
install -v -m644 ${PKG_RECIPEPATH}/files/fake-hwclock-save.service ${PKG_PKGPATH}/lib/systemd/system/fake-hwclock-save.service
install -v -m644 ${PKG_RECIPEPATH}/files/fake-hwclock-save.timer ${PKG_PKGPATH}/lib/systemd/system/fake-hwclock-save.timer
