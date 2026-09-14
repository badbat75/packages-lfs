# curl
PKG_VER=8.11.0
PKG_URL="https://curl.haxx.se/download/curl-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/openssl lfs/make-ca lfs/libidn2 lfs/krb5 lfs/libpsl"
BUILD_PROCESS=cmakebuild
CONF_FLAGS="-DENABLE_THREADED_RESOLVER=True"
CONF_FLAGS+=" -DCURL_CA_PATH=${INSTALL_SYSCONFDIR}/ssl/certs"
CONF_FLAGS+=" -DGSSAPI=True"
PKG_MAKETARGETS="all,install/strip"

PKG_POSTBUILD="    sed -e '/IMPORTED_LOCATION_RELEASE/ s@\"/usr/lib@\"\${CMAKE_SYSROOT}\${_IMPORT_PREFIX}/lib@' \\
        -e '/list(APPEND _cmake_import_check_files_for_CURL::libcurl/ s@\"/usr/lib@\"\${CMAKE_SYSROOT}\${_IMPORT_PREFIX}/lib@' \\
        -e 's@\"\${_IMPORT_PREFIX}@\"\${CMAKE_SYSROOT}\${_IMPORT_PREFIX}@g' \\
        -i \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/CURL/CURLTargets-release.cmake"