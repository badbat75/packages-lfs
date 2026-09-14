# make
PKG_VER=4.4.1
PKG_URL="https://ftp.gnu.org/gnu/make/make-${PKG_VER}.tar.gz"

case "${PKG_TARGET}" in
    native)
        PKG_CHECK="[ x\$( ${INSTALL_EXECPREFIX}/bin/make -v | head -n1 | awk '{print \$3}' ) == x${PKG_VER} ]"
        BUILD_PROCESS=custom
        PKG_BUILDSCRIPT="./configure --prefix=${INSTALL_EXECPREFIX} --with-guile
            ./build.sh
            ./make V=${MAKEVERBOSE:-0} install"
    ;;
    *)
        PKG_AUTOCONF=1
        BUILD_PROCESS=configmake
        CONF_FLAGS="--with-guile"
        PKG_MAKETARGETS="all,install-strip"
    ;;
esac

PKG_POSTBUILD="ln -fsv make \${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/gmake"
