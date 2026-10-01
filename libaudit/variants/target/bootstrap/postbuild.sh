# shellcheck shell=bash
# shellcheck disable=SC2154
# libaudit:bootstrap: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# shellcheck source=/dev/null
source "${PKG_RECIPEPATH}/postbuild.sh"
### Only what the builds over this one compile and link with stays: the libraries, the include files, the pc files
split_install --keep-dev
