# shellcheck shell=bash
# shellcheck disable=SC2154
# libcap2: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i 's/:= $(CROSS_COMPILE)/?= $(CROSS_COMPILE)/g' Make.Rules
	sed -i 's/$(CC) -o/$(CC) $(CFLAGS) -o/g' libcap/Makefile
