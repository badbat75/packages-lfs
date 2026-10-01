# shellcheck shell=bash
# json-c: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### CMakeLists.txt adds -O2 to the flags of Release, which CMake puts after CFLAGS: the level is OPTLEVEL
sed -i '/^set(CMAKE_C_FLAGS_RELEASE[[:space:]].* -O2")$/d' CMakeLists.txt
