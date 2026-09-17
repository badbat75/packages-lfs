# shellcheck shell=bash
# shellcheck disable=SC2154
# boost: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The config file of each library compares its directory with the one b2 installed it into, the
### staging directory (the prefixes of build.sh): the image path
sed -i "s@${PKG_PKGPATH}@@g" "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"/cmake/boost_*/boost_*-config.cmake
