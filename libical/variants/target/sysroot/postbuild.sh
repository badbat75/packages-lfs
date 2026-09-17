# shellcheck shell=bash
# shellcheck disable=SC2154
# libical, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The exported targets list the libraries and the include flags found in the sysroot by path:
### ${CMAKE_SYSROOT} keeps them valid for a cross build and in the image
strip_host_paths --cmake "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"/cmake/LibIcal/{LibIcalTargets,IcalGlibSrcGenerator}.cmake
