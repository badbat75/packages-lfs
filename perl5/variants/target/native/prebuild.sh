# shellcheck shell=bash
# shellcheck disable=SC2154
# perl5, target native: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# Nothing to prepare: the native build runs the Configure of perl itself, so perl-cross (which the
# recipe script unpacks over the sources) stays out of the freshly extracted tree
:
