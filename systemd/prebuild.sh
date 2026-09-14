# shellcheck shell=bash
# shellcheck disable=SC2154
# systemd: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i -e 's/GROUP="render"/GROUP="video"/' -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in
	#sed 's/-ftrivial-auto-var-init=zero//' -i meson.build
	# commit 9374860 solved ^ - To be removed in next releases.
	sed '/^int bus_message_type_from_string/ s/ _pure_;/;/' -i src/libsystemd/sd-bus/bus-internal.h
