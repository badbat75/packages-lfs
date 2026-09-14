# shellcheck shell=bash
# shellcheck disable=SC2154
# lz4: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i 's/$(LN_S)/$(LN_SF)/g' programs/Makefile
    sed -i '/^export LD_LIBRARY_PATH/d' tests/Makefile
