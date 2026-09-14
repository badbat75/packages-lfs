# shellcheck shell=bash
# shellcheck disable=SC2154
# eudev: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

mkdir -pv ${PKG_PKGPATH}${INSTALL_LIBDIR}/systemd
    ln -s ../../sbin/udevd ${PKG_PKGPATH}/usr/lib/systemd/systemd-udevd
