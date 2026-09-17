# shellcheck shell=bash
# shellcheck disable=SC2154
# python3, target builds: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e 's/-fuse-ld=.* / /g' \
	-e 's/-Wl,--threads / /g' \
	-e 's/-Wl,--thread-count,.* / /g' \
	-e 's/-Wl,--thinlto-jobs=.* / /g' \
	-i "${PKG_PKGPATH}${PYTHON_MODPATH}"/_sysconfigdata__*.py
### make install runs compileall.py from the staging directory, which excludes site-packages, where
### LIBDEST is: the only .pyc of the standard library are the ones the import system writes for the
### modules compileall itself imports, and they record the staging path. They go
rm -rfv "${PKG_PKGPATH}${PYTHON_MODPATH}"/__pycache__
grep -r -l -F --include='*.pyc' -e "${PKG_PKGPATH}/" "${PKG_PKGPATH}${PYTHON_MODPATH}" | xargs -r rm -v
### The sysconfig data and the Makefile and config.c of LIBPL keep the source and build trees and the
### compiler, the programs and the flags of the build, which the extension modules built later use.
### An installed Python takes LIBPL for srcdir (sysconfig): so do both trees here
PYTHON_LIBDEST=$(dirname "${PYTHON_MODPATH}")
PYTHON_LIBPL=${PYTHON_LIBDEST}/$(find "${PKG_PKGPATH}${PYTHON_LIBDEST}" -mindepth 1 -maxdepth 1 -type d -name 'config-*' -printf '%P\n')
PYTHON_RECORDS=("${PKG_PKGPATH}${PYTHON_MODPATH}"/_sysconfig{data__*.py,_vars__*.json} "${PKG_PKGPATH}${PYTHON_LIBPL}"/{Makefile,config.c})
sed -e "s@${PKG_BLDPATH}@${PYTHON_LIBPL}@g" -e "s@${PKG_SRCPATH}@${PYTHON_LIBPL}@g" -i "${PYTHON_RECORDS[@]}"
strip_host_paths "${PYTHON_RECORDS[@]}"
