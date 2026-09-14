# shellcheck shell=bash
# shellcheck disable=SC2154
# libuv: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [$UV_EXTRA_AUTOMAKE_FLAGS])" \
    > m4/libuv-extra-automake-flags.m4
