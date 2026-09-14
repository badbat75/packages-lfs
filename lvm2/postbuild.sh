# shellcheck shell=bash
# shellcheck disable=SC2154
# lvm2: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e '/locking_dir =/{s/#//;s/var/run/}' \
    -i ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/lvm/lvm.conf
