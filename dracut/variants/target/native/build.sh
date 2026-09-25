# shellcheck shell=bash
# shellcheck disable=SC2154
# dracut, target native: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}[/${CONF_PATH}], bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

./configure --prefix=${INSTALL_PREFIX}
make V=1 src/install/dracut-install
install -vDm755 src/install/dracut-install ${INSTALL_EXECPREFIX}/bin/dracut-install
