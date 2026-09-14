# shellcheck shell=bash
# shellcheck disable=SC2154
# python3: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e 's/-fuse-ld=.* / /g' \
	-e 's/-Wl,--threads / /g' \
	-e 's/-Wl,--thread-count,.* / /g' \
	-e 's/-Wl,--thinlto-jobs=.* / /g' \
	-i "${PYTHON_MODPATH}"/_sysconfigdata__*.py
	rm -rfv "${PYTHON_MODPATH}"/__pycache__
