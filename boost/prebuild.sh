# shellcheck shell=bash
# shellcheck disable=SC2154
# boost: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's@pkg-config@${PKG_CONFIG:-pkg-config}@g' -i bootstrap.sh
	### set-triple writes a --target of b2 on every command line (architecture=arm with address-model=64
	### gives arm64-pc-linux), and clang chooses its configuration file by the target: the one of the
	### platform, which carries the sysroot and the directories of the cross toolchain, is then never read
	sed 's@ : --target=$(triple)@ :@' -i tools/build/src/tools/clang.jam
