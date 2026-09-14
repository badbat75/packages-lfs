# shellcheck shell=bash
# shellcheck disable=SC2154
# xorg-server: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e "/conf_data.set_quoted('DRI_DRIVER_PATH',/ s@dri_dep.get_pkgconfig_variable('dridriverdir')@get_option('dri_driver_dir')@" -i include/meson.build
	cat >>meson_options.txt <<-EOF
		option('dri_driver_dir', type: 'string')	
	EOF
