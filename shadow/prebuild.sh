# shellcheck shell=bash
# shellcheck disable=SC2154
# shadow: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i '/AM_GNU_GETTEXT_VERSION/ s/0.19/0.20/g' configure.ac
