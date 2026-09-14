# HarfBuzz
PKG_VER=8.5.0
PKG_URL="https://github.com/harfbuzz/harfbuzz/releases/download/${PKG_VER}/harfbuzz-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/gobject-introspection lfs/GLib:bootstrap lfs/icu"
PKG_DEPS+=" lfs/FreeType:bootstrap"
PKG_DEPS+=" lfs/Graphite2:bootstrap"
#PKG_DEPS+=" lfs/Cairo:bootstrap"
BUILD_PROCESS=mesonninja
CONF_FLAGS="-Dintrospection=enabled -Dtests=disabled"
#PKG_MAKETARGETS="all,install"
