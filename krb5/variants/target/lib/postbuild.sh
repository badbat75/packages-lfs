# shellcheck shell=bash
# shellcheck disable=SC2154
# krb5:lib: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the libraries, the client plugins, the include files, pc files, krb5-config and their manual pages stay
split_install --keep "${KRB5_LIB_FILES}"
