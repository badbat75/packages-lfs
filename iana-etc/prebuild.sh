# shellcheck shell=bash
# shellcheck disable=SC2154
# iana-etc: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

mkdir -pv ${PKG_PKGPATH}/etc 
	cp -fv protocols services ${PKG_PKGPATH}/etc/
