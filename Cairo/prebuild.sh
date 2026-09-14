# shellcheck shell=bash
# shellcheck disable=SC2154
# Cairo: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's/PTR/void */' -i util/cairo-trace/lookup-symbol.c
	sed -e '/@prefix@/a exec_prefix=@exec_prefix@' -i util/cairo-script/cairo-script-interpreter.pc.in
