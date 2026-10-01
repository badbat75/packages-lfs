# shellcheck shell=bash
# shellcheck disable=SC2154
# python3, target native: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The modules of the build machine: setuptools and pip up to date, jinja2 and docutils for the
### builds, crossenv for the cross environment of the platforms (lfs/python3:crossenv)
PIP_CACHE_DIR="${DOWNLOAD_PATH}/pip" "${INSTALL_EXECPREFIX}/bin/python3" -m pip install --upgrade setuptools pip jinja2 docutils crossenv
