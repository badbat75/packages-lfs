# shellcheck shell=bash
# shellcheck disable=SC2154
# make: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}[/${CONF_PATH}], bash -ex).
# Used by the native build only (BUILD_PROCESS=custom in package.env).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

./configure --prefix=${INSTALL_EXECPREFIX} --with-guile
./build.sh
./make V=${MAKEVERBOSE:-0} install
