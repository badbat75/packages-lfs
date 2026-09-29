# shellcheck shell=bash
# shellcheck disable=SC2154
# util-linux, target native: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# Nothing: PKG_AUTOCONF=1 runs po/update-potfiles and autoreconf
:
