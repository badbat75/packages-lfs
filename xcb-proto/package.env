# xcb-proto
PKG_VER=1.15.2
PKG_URL="https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-1.15.2.tar.xz"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
PKG_MAKETARGETS="all,install-strip"
case ${PKG_TARGET} in
    bootstrap)
        CONF_ENV="PYTHON=python$( echo ${PYTHON_VER} | cut -d. -f1,2 )"
        PKG_POSTBUILD="PYTHON_BINVER=$( echo ${PYTHON_VER} | cut -d. -f1,2 )
            if [ -d \"\${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python\${PYTHON_BINVER}/site-packages\" ]
            then
                mv -v \"\${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python\${PYTHON_BINVER}/site-packages/xcbgen\" \"\${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python\${PYTHON_BINVER}\"
                rmdir \"\${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python\${PYTHON_BINVER}/site-packages\"
                rm -rfv \"\${PKG_PKGPATH}${INSTALL_PREFIX}/lib/python\${PYTHON_BINVER}/xcbgen/__pycache__\"
            fi"
    ;;
    *)
        CONF_ENV="PYTHON=cross-python3"
    ;;
esac
