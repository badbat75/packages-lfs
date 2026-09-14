# Pango
PKG_VER=1.50.14
PKG_URL="https://download.gnome.org/sources/pango/$(echo "${PKG_VER}" | cut -d. -f1,2)/pango-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/fontconfig"
PKG_DEPS+=" lfs/FriBidi"
PKG_DEPS+=" lfs/GLib"
PKG_DEPS+=" lfs/Cairo:bootstrap"
PKG_DEPS+=" lfs/gobject-introspection"
PKG_DEPS+=" lfs/libX11"
#PKG_DEPS+=" lfs/sysprof"
BUILD_PROCESS=mesonninja
CONF_FLAGS="--wrap-mode=nofallback"
#PKG_MAKETARGETS="all,install"
