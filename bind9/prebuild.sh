# shellcheck shell=bash
# shellcheck disable=SC2154
# bind9: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	bootstrap)
		sed 's/^SUBDIRS =.*/SUBDIRS = . lib/' -i Makefile.in
	;;
esac
