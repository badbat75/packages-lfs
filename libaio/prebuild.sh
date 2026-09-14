# shellcheck shell=bash
# shellcheck disable=SC2154
# libaio: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's/-Werror//' -i harness/Makefile
