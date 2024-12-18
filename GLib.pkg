# GLib
PKG_VER=2.83.2
PKG_URL="https://download.gnome.org/sources/glib/$(echo ${PKG_VER} | cut -d'.' -f1,2)/glib-${PKG_VER}.tar.xz"
case "${PKG_TARGET}" in
	bootstrap)
		PKG_DEPS="lfs/GLib:cross"
		PKG_DEPS+=" lfs/libxslt lfs/pcre2"
	;;
	cross) ;;
	*)
		PKG_DEPS="lfs/GLib:cross lfs/GLib:bootstrap"
		PKG_DEPS+=" lfs/libxslt lfs/pcre2"
		PKG_DEPS+=" lfs/D-Bus"
		PKG_LD_LIBRARY_PATH=${SYSROOT}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
	;;
esac
DBUS_TARGET=bootstrap
BUILD_PROCESS=mesonninja
CONF_FLAGS="-Dglib_debug=disabled -Dman=true -Dtests=false"
#PKG_MAKETARGETS="all,install"
PKG_OVERRIDESTATIC=1