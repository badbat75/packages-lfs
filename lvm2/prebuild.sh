# shellcheck shell=bash
# shellcheck disable=SC2154
# lvm2: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's@../../include/cmds.h@../include/cmds.h@' -i lib/commands/cmd_enum.h
