# shellcheck shell=bash
# shellcheck disable=SC2154
# gobject-introspection: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	cross)
		patchelf --set-rpath "${INSTALL_LIBDIR}" \
			"${INSTALL_EXECPREFIX}"/bin/g-ir-{compiler,generate,inspect} \
			"$(find "${INSTALL_LIBDIR}/gobject-introspection/giscanner" -name "_giscanner.cpython-*.so")"
	;;
	*)
		find ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin -name 'g-ir-*' -printf '%P\n' | xargs -t -I{} ln -sv ${TOOLCHAIN_PATH}/bin/{} ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/{}.cross
		sed '/g_ir_/ s/$/.cross/' -i ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/gobject-introspection-1.0.pc
		# $PKG_CONFIG_SYSROOT_DIR is literal text inside the m4 file
		sed '/INTROSPECTION_.[A-Z]*=/ s/$PKG_CONFIG_SYSROOT_DIR//' -i ${PKG_PKGPATH}${INSTALL_SHAREDIR}/aclocal/introspection.m4
	;;
esac
