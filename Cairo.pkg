# Cairo
PKG_VER=1.17.6
PKG_URL="https://download.gnome.org/sources/cairo/$(echo "${PKG_VER}" | cut -d. -f1,2)/cairo-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/libpng lfs/Pixman lfs/fontconfig lfs/GLib lfs/libX11 lfs/libXrender lfs/libxcb"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
PKG_MAKETARGETS=",install"

PKG_CFLAGS="-Wno-enum-conversion"

PKG_PREBUILD="sed 's/PTR/void */' -i util/cairo-trace/lookup-symbol.c
	sed -e '/@prefix@/a exec_prefix=@exec_prefix@' -i util/cairo-script/cairo-script-interpreter.pc.in"

case ${PKG_TARGET} in
	bootstrap) ;;
	*)
		#PKG_DEPS+=" lfs/Cogl"
		PKG_DEPS+=" lfs/ghostscript"
		#PKG_DEPS+=" lfs/GTK+"
		#PKG_DEPS+=" lfs/GTK+2"
		#PKG_DEPS+=" lfs/GTK-Doc"
		PKG_DEPS+=" lfs/libdrm"
		PKG_DEPS+=" lfs/librsvg"
		PKG_DEPS+=" lfs/libxml2"
		PKG_DEPS+=" lfs/lzo"
		PKG_DEPS+=" lfs/Mesa"
		PKG_DEPS+=" lfs/Poppler"
		#PKG_DEPS+=" lfs/Qt"
		#PKG_DEPS+=" lfs/Qt4"
		#PKG_DEPS+=" lfs/Valgrind"
		#PKG_DEPS+=" lfs/DirectFB"
		PKG_DEPS+=" lfs/jbig2dec"
		PKG_DEPS+=" lfs/libspectre"
		#PKG_DEPS+=" lfs/Skia"
		CONF_FLAGS="--enable-tee --enable-xml --enable-xlib-xcb --enable-glesv3"
	;;
esac

CONF_FLAGS+=" ax_cv_c_float_words_bigendian=no"
