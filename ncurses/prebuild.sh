# shellcheck shell=bash
# shellcheck disable=SC2154
# ncurses: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i '/INSTALL_OPT_S="-s"/ s/-s/--strip-program ${STRIP} -s/' configure
