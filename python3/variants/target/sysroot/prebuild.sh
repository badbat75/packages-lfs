# shellcheck shell=bash
# shellcheck disable=SC2154
# python3, target builds: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### getpath compiles VPATH, the source tree as configure names it (absolute), into libpython: it joins it to
### the directory of a python started from its build tree. The same tree relative to the build directory
### finds the same files and names no directory of the build host
PYTHON_VPATH=$(realpath -m --relative-to="${PKG_BLDPATH}" "${PKG_SRCPATH}")
sed -e "s@-DVPATH='\"\$(VPATH)\"'@-DVPATH='\"${PYTHON_VPATH}\"'@" -i Makefile.pre.in
