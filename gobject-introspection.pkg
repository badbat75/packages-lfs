# gobject-introspection
PKG_VER=1.82.0
PKG_URL="https://download.gnome.org/sources/gobject-introspection/$(echo ${PKG_VER} | cut -d. -f1,2)/gobject-introspection-${PKG_VER}.tar.xz"
BUILD_PROCESS=mesonninja
PKG_DEPS="lfs/bison:native lfs/flex:native"

case ${PKG_TARGET} in
	cross)
		PKG_DEPS+=" lfs/GLib:cross"
		CONF_FLAGS="-Dpython=python3"
		PKG_POSTBUILD="patchelf --set-rpath \"${INSTALL_LIBDIR}\" \\
				\"${INSTALL_EXECPREFIX}\"/bin/g-ir-{compiler,generate,inspect} \\
				\"\$(find \"${INSTALL_LIBDIR}/gobject-introspection/giscanner\" -name \"_giscanner.cpython-*.so\")\""
	;;
	*)
		PKG_DEPS=" lfs/GLib:bootstrap lfs/gobject-introspection:cross lfs/pcre2"
		CONF_FLAGS="-Dpython=cross-python3 -Dgi_cross_use_prebuilt_gi=true"
		PKG_MAKEENV="LD_LIBRARY_PATH=${TOOLCHAIN_PATH}/lib"
		PKG_POSTBUILD="find \${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin -name 'g-ir-*' -printf '%P\\n' | xargs -t -I{} ln -sv ${TOOLCHAIN_PATH}/bin/{} \${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/{}.cross
			sed '/g_ir_/ s/\$/.cross/' -i \${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/gobject-introspection-1.0.pc
			sed '/INTROSPECTION_.[A-Z]*=/ s/\$PKG_CONFIG_SYSROOT_DIR//' -i \${PKG_PKGPATH}${INSTALL_SHAREDIR}/aclocal/introspection.m4"
		PKG_POSTINSTALL="if [ -f ${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/gobject-introspection-1.0.pc ]; then
sed '/g_ir_/ s/.cross\$//' -i ${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/gobject-introspection-1.0.pc
fi
rm -fv ${INSTALL_EXECPREFIX}/bin/g-ir-*.cross"
	;;
esac
