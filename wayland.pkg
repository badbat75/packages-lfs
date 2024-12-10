# wayland
PKG_VER=1.22.0
PKG_URL="https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PKG_VER}/downloads/wayland-${PKG_VER}.tar.xz"
BUILD_PROCESS=mesonninja
CONF_FLAGS="-Dtests=false"
#PKG_MAKETARGETS="all,install"
case ${PKG_TARGET} in
    cross) 
        PKG_DEPS="lfs/expat:cross"
        CONF_FLAGS+=" -Ddocumentation=false"
    ;;
    *)
        PKG_DEPS="lfs/doxygen:native lfs/xmlto:native lfs/libxml2 lfs/expat lfs/wayland:cross"
        CONF_ENV="PKG_CONFIG_SYSROOT_DIR= PKG_CONFIG_LIBDIR+=:${TOOLCHAIN_PATH}/lib/pkgconfig"
    ;;
esac
