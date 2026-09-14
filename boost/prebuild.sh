# shellcheck shell=bash
# shellcheck disable=SC2154
# boost: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's@pkg-config@${PKG_CONFIG:-pkg-config}@g' -i bootstrap.sh
	sed 's@: "--target=.*"@: ""@g' -i tools/build/src/tools/clang.jam
