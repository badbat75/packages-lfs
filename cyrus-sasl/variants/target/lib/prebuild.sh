# shellcheck shell=bash
# shellcheck disable=SC2154
# cyrus-sasl:lib: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the library and its plugins are built (autoreconf makes Makefile.in from it after this
### script): not the utilities, pwcheck, the samples, saslauthd
sed 's/^SUBDIRS=.*/SUBDIRS=include sasldb common lib plugins/' -i Makefile.am
