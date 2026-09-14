# shellcheck shell=bash
# shellcheck disable=SC2154
# bash: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i 's/(INSTALL_PROGRAM) -s/(INSTALL_PROGRAM) --strip-program=\${STRIP} -s/' Makefile.in
