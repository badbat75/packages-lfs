# shellcheck shell=bash
# shellcheck disable=SC2154
# nss:tool: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# shellcheck source=/dev/null
source "${PKG_RECIPEPATH}/postbuild.sh"
### Only the database and certificate tools stay
split_install --keep "${NSS_TOOL_FILES}"
