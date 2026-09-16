# shellcheck shell=bash
# shellcheck disable=SC2154
# dracut: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# dracut-ng stamps the version into the dracut script itself (DRACUT_VERSION="112"), there is no
# dracut-version.sh any more: mark the build as ours inside the quotes
sed "/^DRACUT_VERSION=/ s/\"\$/-lfs\"/" -i ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/dracut
