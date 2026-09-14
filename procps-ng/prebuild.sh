# shellcheck shell=bash
# shellcheck disable=SC2154
# procps-ng: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's@ncursesw/ncurses.h@ncurses.h@' -i src/watch.c
    ./autogen.sh
