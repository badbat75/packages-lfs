# shellcheck shell=bash
# shellcheck disable=SC2154
# Vulkan-SPIRV-Tools: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The ${CMAKE_SYSROOT} inside the sed expressions is literal text for CMake, not a shell variable.

case ${PKG_TARGET} in
	cross) ;;
	*)
		CMAKEDIR=${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/cmake
		sed -i 's|set(_IMPORT_PREFIX "|set(_IMPORT_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/SPIRV-Tools-opt/SPIRV-Tools-optTargets.cmake
		sed -i 's|INTERFACE_INCLUDE_DIRECTORIES "|INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SYSROOT}|' ${CMAKEDIR}/SPIRV-Tools-opt/SPIRV-Tools-optTargets.cmake

		sed -i 's|IMPORTED_LOCATION_RELEASE "|IMPORTED_LOCATION_RELEASE "${CMAKE_SYSROOT}|' ${CMAKEDIR}/SPIRV-Tools-opt/SPIRV-Tools-optTargets-release.cmake
		sed -i 's|_check_files_for_SPIRV-Tools-opt "|_check_files_for_SPIRV-Tools-opt "${CMAKE_SYSROOT}|' ${CMAKEDIR}/SPIRV-Tools-opt/SPIRV-Tools-optTargets-release.cmake

		sed -i 's|set(_IMPORT_PREFIX "|set(_IMPORT_PREFIX "${CMAKE_SYSROOT}|' ${CMAKEDIR}/SPIRV-Tools/SPIRV-ToolsTarget.cmake
		sed -i 's|INTERFACE_INCLUDE_DIRECTORIES "|INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SYSROOT}|' ${CMAKEDIR}/SPIRV-Tools/SPIRV-ToolsTarget.cmake

		sed -i 's|IMPORTED_LOCATION_RELEASE "|IMPORTED_LOCATION_RELEASE "${CMAKE_SYSROOT}|' ${CMAKEDIR}/SPIRV-Tools/SPIRV-ToolsTarget-release.cmake
		sed -i 's|_check_files_for_SPIRV-Tools-static "|_check_files_for_SPIRV-Tools-static "${CMAKE_SYSROOT}|' ${CMAKEDIR}/SPIRV-Tools/SPIRV-ToolsTarget-release.cmake
		sed -i 's|_check_files_for_SPIRV-Tools-shared "|_check_files_for_SPIRV-Tools-shared "${CMAKE_SYSROOT}|' ${CMAKEDIR}/SPIRV-Tools/SPIRV-ToolsTarget-release.cmake
	;;
esac
