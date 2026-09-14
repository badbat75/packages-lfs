# shellcheck shell=bash
# shellcheck disable=SC2154
# cracklib: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

cd src
	sed -i '/AM_GNU_GETTEXT_VERSION/ s/0.17/0.20/g' configure.ac
	./autogen.sh
    sed -i '/skipping/d' util/packer.c
	#sed -i '15209 s/.*/am_cv_python_version=${PYTHONBIN_VER}/' configure
