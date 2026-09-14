# shellcheck shell=bash
# shellcheck disable=SC2154
# xcb-proto: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	bootstrap)
		PYTHON_BINVER=$( echo ${PYTHON_VER} | cut -d. -f1,2 )
		if [ -d "${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python${PYTHON_BINVER}/site-packages" ]
		then
			mv -v "${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python${PYTHON_BINVER}/site-packages/xcbgen" "${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python${PYTHON_BINVER}"
			rmdir "${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python${PYTHON_BINVER}/site-packages"
			rm -rfv "${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python${PYTHON_BINVER}/xcbgen/__pycache__"
		fi
	;;
esac
