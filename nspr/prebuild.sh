# shellcheck shell=bash
# shellcheck disable=SC2154
# nspr: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -ri '/^RELEASE/s/^/#/' nspr/pr/src/misc/Makefile.in
