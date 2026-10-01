# shellcheck shell=bash
# shellcheck disable=SC2154
# cyrus-sasl:lib: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the library, its plugins, include files, pc file and manual pages stay
split_install --keep "${SASL_LIB_FILES}"
