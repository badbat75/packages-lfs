# shellcheck shell=bash
# shellcheck disable=SC2154
# dracut: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed "/^DRACUT_VERSION=/ s/\$/${PKG_VER}-lfs/" -i ${PKG_PKGPATH}/usr/lib/dracut/dracut-version.sh
