# shellcheck shell=bash
# shellcheck disable=SC2154
# twm: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e '/^rcdir =/s,^\(rcdir = \).*,\1/etc/X11/app-defaults,' -i src/Makefile.am
