# librsvg
PKG_VER=2.56.0
PKG_URL="https://download.gnome.org/sources/librsvg/$(echo "${PKG_VER}" | cut -d. -f1,2)/librsvg-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/Cairo:bootstrap"
PKG_DEPS+=" lfs/gdk-pixbuf"
PKG_DEPS+=" lfs/Pango"
PKG_DEPS+=" lfs/gobject-introspection"
#PKG_DEPS+=" lfs/Vala"
PKG_DEPS+=" lfs/HarfBuzz"
PKG_DEPS+=" lfs/libxml2"
PKG_DEPS+=" lfs/GLib"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=" --docdir=${INSTALL_SHAREDIR}/doc/librsvg-${PKG_VER} --host \${CARGO_TARGET}"
PKG_MAKEENV="XDG_DATA_DIRS=\${SYSROOT}${INSTALL_SHAREDIR}"
PKG_MAKETARGETS=",install-strip"

