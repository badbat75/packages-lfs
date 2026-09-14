# shellcheck shell=bash
# shellcheck disable=SC2154
# tpm2-tss: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e '/^git describe/d' -e '/^${AUTORECONF}/d' -i bootstrap
    echo 4.0.0 > VERSION
    ./bootstrap
