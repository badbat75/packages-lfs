# shellcheck shell=bash
# shellcheck disable=SC2154
# pciutils: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's/^CFLAGS=/CFLAGS?=/;s/^CC=/CC?=/;s/^AR=/AR?=/;s/^RANLIB=/RANLIB?=/' -i Makefile
