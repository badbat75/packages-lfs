# shellcheck shell=bash
# shellcheck disable=SC2154
# Mesa: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e '/#include <sstream>/a #include <limits>' -i src/gallium/drivers/r600/sfn/sfn_valuefactory.cpp
