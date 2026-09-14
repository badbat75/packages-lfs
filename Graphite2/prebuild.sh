# shellcheck shell=bash
# shellcheck disable=SC2154
# Graphite2: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed '/add_definitions(-mfpmath=sse -msse2)/d' -i src/CMakeLists.txt
    sed '/cmptest/d' -i tests/CMakeLists.txt
