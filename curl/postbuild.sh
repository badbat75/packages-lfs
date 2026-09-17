# shellcheck shell=bash
# shellcheck disable=SC2154
# curl: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

    sed -e '/IMPORTED_LOCATION_RELEASE/ s@"/usr/lib@"${CMAKE_SYSROOT}${_IMPORT_PREFIX}/lib@' \
        -e '/list(APPEND _cmake_import_check_files_for_CURL::libcurl/ s@"/usr/lib@"${CMAKE_SYSROOT}${_IMPORT_PREFIX}/lib@' \
        -e 's@"${_IMPORT_PREFIX}@"${CMAKE_SYSROOT}${_IMPORT_PREFIX}@g' \
        -i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/CURL/CURLTargets-release.cmake
### curl-config --cc names the compiler; CURLConfig.cmake lists the libraries found in the sysroot
### by path, which ${CMAKE_SYSROOT} keeps valid for a cross build and in the image
strip_host_paths "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/curl-config"
strip_host_paths --cmake "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/CURL/CURLConfig.cmake"
