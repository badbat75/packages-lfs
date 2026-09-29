# shellcheck shell=bash
# shellcheck disable=SC2154
# lfs-utils: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -D -m755 ${PKG_RECIPEPATH}/files/growroot.sh ${PKG_PKGPATH}/opt/lfs-utils/growroot.sh
install -v -D -m755 ${PKG_RECIPEPATH}/files/dracut-hostonly.sh ${PKG_PKGPATH}/opt/lfs-utils/dracut-hostonly.sh
