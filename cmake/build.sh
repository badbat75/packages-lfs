# shellcheck shell=bash
# shellcheck disable=SC2154
# cmake: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}[/${CONF_PATH}], bash -ex).
# Used by the native build only (BUILD_PROCESS=custom in package.env).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

${PKG_SRCPATH}/bootstrap --prefix=${INSTALL_PREFIX} --parallel=${NPROCS} ${CMAKE_CCACHE_ENABLED} $(if [ ${MAKEVERBOSE:-0} -eq 1 ]; then echo --verbose; fi) -- \
	-DCMAKE_AR=${AR} -DCMAKE_NM=${NM} -DCMAKE_RANLIB=${RANLIB}
make install
