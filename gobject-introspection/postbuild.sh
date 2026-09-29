# shellcheck shell=bash
# shellcheck disable=SC2154
# gobject-introspection: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The cross build has its own (variants/target/cross/postbuild.sh).

### The python scripts get "/usr/bin/env <python>" from the interpreter meson ran with, the
### cross-python3 of the toolchain here: the python3 of the image (the .cross links below reach the
### toolchain copies, not these)
sed -i '1 s|^#!/usr/bin/env .*python3$|#!/usr/bin/env python3|' \
	"${PKG_PKGPATH}${INSTALL_EXECPREFIX}"/bin/g-ir-{scanner,annotation-tool}
### The .cross links point at the platform toolchain, so build logs "host paths in 5 files" for them:
### they serve the builds that follow, and postinstall.sh removes them inside the image
find ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin -name 'g-ir-*' -printf '%P\n' | xargs -t -I{} ln -sv ${TOOLCHAIN_PATH}/bin/{} ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/{}.cross
### The introspection dumper is a program of the target: g-ir-scanner.cross runs it through
### <HARCH>-run (qemu, or the loader of the sysroot on the machine of the build host), as the
### exe_wrapper of the meson cross file, which generate_gir does not pass on. A copy, not a link: the scanner finds share/gir-1.0 relative to its own path (the
### sysroot); an option given later on the command line wins
rm "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/g-ir-scanner.cross"
sed '0,/^import sys$/ s//import sys\nsys.argv[1:1] = ["--use-binary-wrapper='"${HARCH}"'-run"]/' \
	"${TOOLCHAIN_PATH}/bin/g-ir-scanner" > "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/g-ir-scanner.cross"
chmod 755 "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/g-ir-scanner.cross"
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
