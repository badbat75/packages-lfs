# shellcheck shell=bash
# shellcheck disable=SC2154
# boost: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The config file of each library compares its directory with the one b2 installed it into, the
### staging directory (the prefixes of build.sh): the image path
sed -i "s@${PKG_PKGPATH}@@g" "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"/cmake/boost_*/boost_*-config.cmake

### exception and test_exec_monitor are the only libraries b2 builds static, their Jamfile pins it: with
### static libraries off they have no place in the image, and their LTO bytecode names the build host
if [ "${PKG_OVERRIDESTATIC:-${BUILD_LIBSTATIC}}" -eq 0 ]
then
	rm -fv "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libboost_exception.a" \
		"${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libboost_test_exec_monitor.a"
fi
