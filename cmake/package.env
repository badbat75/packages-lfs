# cmake
PKG_VER=3.26.3
PKG_URL="https://github.com/Kitware/CMake/releases/download/v${PKG_VER}/cmake-${PKG_VER}.tar.gz"
PKG_DEPS=
PKG_MAKETARGETS="all,install/strip"

case "${PKG_TARGET}" in
	native)
		PKG_CHECK="[ x\$( ${INSTALL_EXECPREFIX}/bin/cmake --version | awk 'NR==1{print \$3}' || true ) == x${PKG_VER} ]"
		BUILD_PROCESS=custom
		##### Broken CMake bootstrap with sccache #####
		##### CMAKE_CCACHE_ENABLED="--enable-ccache"
		PKG_BUILDSCRIPT="\${PKG_SRCPATH}/bootstrap --prefix=${INSTALL_PREFIX} --parallel=${NPROCS} ${CMAKE_CCACHE_ENABLED} $(if [ ${MAKEVERBOSE:-0} -eq 1 ]; then echo --verbose; fi) -- \\
			-DCMAKE_AR=\${AR} -DCMAKE_NM=\${NM} -DCMAKE_RANLIB=\${RANLIB}
			make install"
	;;
	*)
		BUILD_PROCESS=cmakebuild
		CONF_FLAGS=
	;;
esac
