# Vulkan-SPIRV-Tools
PKG_VER=1.3.296.0
PKG_URL="https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/vulkan-sdk-${PKG_VER}.tar.gz"
BUILD_PROCESS=cmakebuild
case ${PKG_TARGET} in
	cross)
		PKG_DEPS=lfs/Vulkan-SPIRV-Headers:cross
		CONF_FLAGS="-DSPIRV-Headers_SOURCE_DIR=${TOOLCHAIN_PATH}"
		PKG_MAKETARGETS="all,install/strip"
	;;
	*)
		PKG_DEPS=lfs/Vulkan-SPIRV-Headers
		CONF_FLAGS="-DSPIRV-Headers_SOURCE_DIR=\${SYSROOT}${INSTALL_PREFIX} -DPYTHON_EXECUTABLE:FILEPATH=cross-python3"
		PKG_MAKETARGETS="all,install/strip"
		PKG_POSTBUILD="
			sed -i 's|set(_IMPORT_PREFIX \"|set(_IMPORT_PREFIX \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/SPIRV-Tools-opt/SPIRV-Tools-optTargets.cmake
			sed -i 's|INTERFACE_INCLUDE_DIRECTORIES \"|INTERFACE_INCLUDE_DIRECTORIES \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/SPIRV-Tools-opt/SPIRV-Tools-optTargets.cmake

			sed -i 's|IMPORTED_LOCATION_RELEASE \"|IMPORTED_LOCATION_RELEASE \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/SPIRV-Tools-opt/SPIRV-Tools-optTargets-release.cmake
			sed -i 's|_check_files_for_SPIRV-Tools-opt \"|_check_files_for_SPIRV-Tools-opt \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/SPIRV-Tools-opt/SPIRV-Tools-optTargets-release.cmake

			sed -i 's|set(_IMPORT_PREFIX \"|set(_IMPORT_PREFIX \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake
			sed -i 's|INTERFACE_INCLUDE_DIRECTORIES \"|INTERFACE_INCLUDE_DIRECTORIES \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake

			sed -i 's|IMPORTED_LOCATION_RELEASE \"|IMPORTED_LOCATION_RELEASE \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/SPIRV-Tools/SPIRV-ToolsTarget-release.cmake
			sed -i 's|_check_files_for_SPIRV-Tools-static \"|_check_files_for_SPIRV-Tools-static \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/SPIRV-Tools/SPIRV-ToolsTarget-release.cmake
			sed -i 's|_check_files_for_SPIRV-Tools-shared \"|_check_files_for_SPIRV-Tools-shared \"\${CMAKE_SYSROOT}|' \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake/SPIRV-Tools/SPIRV-ToolsTarget-release.cmake
		"
	;;
esac
