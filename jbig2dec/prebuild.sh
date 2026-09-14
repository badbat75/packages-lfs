# shellcheck shell=bash
# shellcheck disable=SC2154
# jbig2dec: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed '/^$srcdir\/configure/d' -i autogen.sh
    ./autogen.sh
