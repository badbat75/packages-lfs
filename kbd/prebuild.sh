# shellcheck shell=bash
# shellcheck disable=SC2154
# kbd: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure.ac
    sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
