# shellcheck shell=bash
# shellcheck disable=SC2154
# openldap:lib: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the include files, the libraries and the manual pages are built and installed
sed 's/^SUBDIRS=.*/SUBDIRS= include libraries doc/' -i Makefile.in
