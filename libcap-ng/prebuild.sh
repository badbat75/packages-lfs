# shellcheck shell=bash
# shellcheck disable=SC2154
# libcap-ng: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The repository has no NEWS, which automake requires: autogen.sh creates it before autoreconf
touch NEWS
