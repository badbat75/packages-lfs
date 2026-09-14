# meson
PKG_VER=1.6.1
#PKG_URL="https://github.com/mesonbuild/meson/archive/refs/tags/${PKG_VER}.tar.gz"
BUILD_PROCESS=pythonbuild
# CONF_FLAGS=""

case ${PKG_TARGET} in
    native) PKG_CHECK="[ x\$( ${INSTALL_EXECPREFIX}/bin/meson -v ) == x${PKG_VER} ]" ;;
esac
