# shellcheck shell=bash
# shellcheck disable=SC2154
# coreutils: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

if [ ${LFS_SPLITUSR:-0} -eq 1 ]
then
	mkdir -pv ${PKG_PKGPATH}/bin
	ln -s ../usr/bin/{false,true} ${PKG_PKGPATH}/bin
fi
