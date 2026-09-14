# shellcheck shell=bash
# shellcheck disable=SC2154
# sysstat: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}/lib/systemd/system
    install -v -m644 sysstat.service ${PKG_PKGPATH}/lib/systemd/system/sysstat.service
    install -v -m644 cron/sysstat-collect.service ${PKG_PKGPATH}/lib/systemd/system/sysstat-collect.service
    install -v -m644 cron/sysstat-collect.timer ${PKG_PKGPATH}/lib/systemd/system/sysstat-collect.timer
    install -v -m644 cron/sysstat-summary.service ${PKG_PKGPATH}/lib/systemd/system/sysstat-summary.service
    install -v -m644 cron/sysstat-summary.timer ${PKG_PKGPATH}/lib/systemd/system/sysstat-summary.timer
    sed -i '/^Also=/d' ${PKG_PKGPATH}/lib/systemd/system/sysstat.service
