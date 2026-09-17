# shellcheck shell=bash
# shellcheck disable=SC2154
# Sourced by runprebuild.sh: cwd is PKG_SRCPATH, set -x without -e

### llvm-config keeps the source and the build directory of the host (LLVM_SRC_ROOT and LLVM_OBJ_ROOT
### of BuildVariables.inc), and reads them only to tell a build tree from an installed prefix: the
### installed program finds its own prefix from its path, so the two names are dead weight in the image
sed -e '/^set(LLVM_SRC_ROOT /s@.*@set(LLVM_SRC_ROOT "")@' \
	-e '/^set(LLVM_OBJ_ROOT /s@.*@set(LLVM_OBJ_ROOT "")@' \
	-i llvm/tools/llvm-config/CMakeLists.txt
