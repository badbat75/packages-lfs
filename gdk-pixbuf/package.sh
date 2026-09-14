# gdk-pixbuf
PKG_VER=2.42.10
PKG_URL="https://download.gnome.org/sources/gdk-pixbuf/$(echo "${PKG_VER}" | cut -d. -f1,2)/gdk-pixbuf-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/GLib"
PKG_DEPS+=" lfs/shared-mime-info"
PKG_DEPS+=" lfs/libjpeg-turbo"
PKG_DEPS+=" lfs/libpng"
PKG_DEPS+=" lfs/libtiff"
PKG_DEPS+=" lfs/gobject-introspection"
BUILD_PROCESS=mesonninja
CONF_FLAGS="--wrap-mode=nofallback -Dintrospection=enabled"
#PKG_MAKETARGETS="all,install"
