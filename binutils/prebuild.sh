# shellcheck shell=bash
# shellcheck disable=SC2154
# binutils: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed '/^AM_CFLAGS_FOR_BUILD/ s/\$(ZSTD_CFLAGS)//' -i binutils/Makefile.in
