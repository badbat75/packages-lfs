# shellcheck shell=bash
# shellcheck disable=SC2154
# openldap:client: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The libraries the tools link are built, not installed by this target alone: the install of
### libraries is left to split_install. servers and tests are not built
sed 's/^SUBDIRS=.*/SUBDIRS= include libraries clients doc/' -i Makefile.in
