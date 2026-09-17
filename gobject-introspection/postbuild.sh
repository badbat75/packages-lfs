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
		### The programs and girdir point into the sysroot through ${pc_sysrootdir}, which pkgconf keeps
		### under the FDO sysroot rules of target builds (/ in the image)
		# shellcheck disable=SC2016
		sed -E -e 's/^(g_ir_[a-z]+)=\$\{bindir\}\//\1=${pc_sysrootdir}${bindir}\//' -e 's/^girdir=/girdir=${pc_sysrootdir}/' \
			-i "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"/pkgconfig/gobject-introspection{,-no-export}-1.0.pc
		### $PKG_CONFIG_SYSROOT_DIR is literal text inside the m4 file: the programs already carry the
		### sysroot, Makefile.introspection (datadir) needs it
		# shellcheck disable=SC2016
		sed '/INTROSPECTION_\(SCANNER\|COMPILER\|GENERATE\)=/ s/$PKG_CONFIG_SYSROOT_DIR//' -i "${PKG_PKGPATH}${INSTALL_SHAREDIR}/aclocal/introspection.m4"
	;;
esac
