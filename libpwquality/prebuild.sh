# shellcheck shell=bash
# shellcheck disable=SC2154
# libpwquality: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_BLDPATH}/src install -vdm755 ${PKG_BLDPATH}/python
	ln -fsv ${PKG_SRCPATH}/src/pwquality.h ${PKG_BLDPATH}/src/pwquality.h
	ln -fsv ${PKG_SRCPATH}/python/pwquality.c ${PKG_BLDPATH}/python/pwquality.c
