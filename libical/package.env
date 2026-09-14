# libical
PKG_VER=3.0.16
PKG_URL="https://github.com/libical/libical/releases/download/v${PKG_VER}/libical-${PKG_VER}.tar.gz"
PATCH=""
PKG_DEPS="lfs/icu lfs/GLib lfs/BerkeleyDB"
BUILD_PROCESS=cmakebuild
CONF_ENV="PYTHON=cross-python3"
CONF_FLAGS="-DICAL_GLIB=True -DLIBICAL_BUILD_TESTING=False -DICAL_BUILD_DOCS=False -DGOBJECT_INTROSPECTION=False -DICAL_GLIB_VAPI=False -DENABLE_GTK_DOC=False"
CONF_FLAGS+=" -DPERL_EXECUTABLE=$(which perl)"
PKG_MAKETARGETS="all,install/strip"
