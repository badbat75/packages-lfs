# shellcheck shell=bash
# shellcheck disable=SC2154
# cyrus-sasl:server: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# shellcheck source=/dev/null
source "${PKG_RECIPEPATH}/postbuild.sh"
### What lfs/cyrus-sasl:lib installs goes
split_install --drop "${SASL_LIB_FILES}"
