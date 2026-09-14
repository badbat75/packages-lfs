# shellcheck shell=bash
# shellcheck disable=SC2154
# Linux-PAM: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	bootstrap)
		sed 's/^SUBDIRS =.*/SUBDIRS = libpam libpamc libpam_misc/' -i Makefile.am
	;;
	*)
		sed -e 's/dummy elinks/dummy lynx/' \
			-e 's/-no-numbering -no-references/-force-html -nonumbers -stdin/' \
			-i configure
	;;
esac
