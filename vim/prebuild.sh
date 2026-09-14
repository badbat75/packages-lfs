# shellcheck shell=bash
# shellcheck disable=SC2154
# vim: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i 's/ln -s/ln -fsv/g' src/Makefile
	echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
