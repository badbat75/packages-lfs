# shellcheck shell=bash
# shellcheck disable=SC2154
# krb5:server: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### What lfs/krb5:lib and lfs/krb5:client install goes
split_install --drop "${KRB5_LIB_FILES} ${KRB5_CLIENT_FILES}"
