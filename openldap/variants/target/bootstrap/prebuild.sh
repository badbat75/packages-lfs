# shellcheck shell=bash
# shellcheck disable=SC2154
# openldap:bootstrap: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the include files and the libraries are built
sed 's/^SUBDIRS=.*/SUBDIRS= include libraries/' -i Makefile.in
