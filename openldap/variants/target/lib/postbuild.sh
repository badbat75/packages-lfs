# shellcheck shell=bash
# shellcheck disable=SC2154
# openldap:lib: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the libraries, their include files, pc files, ldap.conf and manual pages stay
split_install --keep "${OPENLDAP_LIB_FILES}"
