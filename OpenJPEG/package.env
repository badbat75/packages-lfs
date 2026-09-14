# OpenJPEG
PKG_VER=2.5.0
PKG_URL="https://github.com/uclouvain/openjpeg/archive/v${PKG_VER}/openjpeg-${PKG_VER}.tar.gz"
PKG_DEPS=" lfs/LittleCMS"
PKG_DEPS+=" lfs/libpng"
PKG_DEPS+=" lfs/libtiff"

BUILD_PROCESS=cmakebuild
CONF_FLAGS="-DOPENJPEG_INSTALL_LIB_DIR:path=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
#PKG_MAKETARGETS="all,install"

### Not using SYSROOT
PKG_POSTBUILD="sed -e '/IMPORTED_LOCATION_RELEASE/ s@\"/usr/lib@\"\${CMAKE_SYSROOT}\${_IMPORT_PREFIX}/lib@' \\
		-e '/list(APPEND _cmake_import_check_files_for_openjp2/ s@\"/usr/lib@\"\${CMAKE_SYSROOT}\${_IMPORT_PREFIX}/lib@' \\
		-e 's@\"\${_IMPORT_PREFIX}@\"\${CMAKE_SYSROOT}\${_IMPORT_PREFIX}@g' \\
		-i \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/openjpeg-$(echo ${PKG_VER} | cut -d. -f1,2)/OpenJPEGTargets-release.cmake
		sed -e 's@\"\${_IMPORT_PREFIX}@\"\${CMAKE_SYSROOT}\${_IMPORT_PREFIX}@g' \\
		-i \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/openjpeg-$(echo ${PKG_VER} | cut -d. -f1,2)/OpenJPEGTargets.cmake
		sed -e 's@\"/usr/@\"\${CMAKE_SYSROOT}\${_IMPORT_PREFIX}/@g' \\
		-i \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/openjpeg-$(echo ${PKG_VER} | cut -d. -f1,2)/OpenJPEGConfig.cmake"