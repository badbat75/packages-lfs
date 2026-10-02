# shellcheck shell=bash
# libical: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### CMakeLists.txt appends -O2 to CMAKE_C_FLAGS and CMAKE_CXX_FLAGS for gcc and clang, after CFLAGS:
### the level is OPTLEVEL
sed -i '/^[[:space:]]*-O2 \\$/d' CMakeLists.txt
