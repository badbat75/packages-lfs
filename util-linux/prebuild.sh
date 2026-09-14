# shellcheck shell=bash
# shellcheck disable=SC2154
# util-linux: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

po/update-potfiles; autoreconf -fi
