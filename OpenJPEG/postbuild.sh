# shellcheck shell=bash
# shellcheck disable=SC2154
# OpenJPEG: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e '/IMPORTED_LOCATION_RELEASE/ s@"/usr/lib@"${CMAKE_SYSROOT}${_IMPORT_PREFIX}/lib@' \
		-e '/list(APPEND _cmake_import_check_files_for_openjp2/ s@"/usr/lib@"${CMAKE_SYSROOT}${_IMPORT_PREFIX}/lib@' \
		-e 's@"${_IMPORT_PREFIX}@"${CMAKE_SYSROOT}${_IMPORT_PREFIX}@g' \
		-i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/openjpeg-$(echo ${PKG_VER} | cut -d. -f1,2)/OpenJPEGTargets-release.cmake
		sed -e 's@"${_IMPORT_PREFIX}@"${CMAKE_SYSROOT}${_IMPORT_PREFIX}@g' \
		-i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/openjpeg-$(echo ${PKG_VER} | cut -d. -f1,2)/OpenJPEGTargets.cmake
		sed -e 's@"/usr/@"${CMAKE_SYSROOT}${_IMPORT_PREFIX}/@g' \
		-i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/openjpeg-$(echo ${PKG_VER} | cut -d. -f1,2)/OpenJPEGConfig.cmake
