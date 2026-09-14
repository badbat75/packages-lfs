# shellcheck shell=bash
# shellcheck disable=SC2154
# gdb: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${GDB_VER} in
	12.*)
		sed -i '/return/s/rl.*characters/(char *) &/' gdb/completer.c
	;;
esac
