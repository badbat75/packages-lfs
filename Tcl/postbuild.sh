# shellcheck shell=bash
# shellcheck disable=SC2154
# Tcl: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### tclsh and the library carry the major.minor version (tclsh9.0, libtcl9.0.so)
ln -v -sfv tclsh${PKG_VER%.*} ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/tclsh
mv ${PKG_PKGPATH}${INSTALL_SHAREDIR}/man/man3/{Thread,Tcl_Thread}.3
chmod -v 755 ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libtcl${PKG_VER%.*}.so
### tclConfig.sh, itclConfig.sh and tdbcConfig.sh point the extensions at the build and source trees
### (the BUILD_ values, SRC_DIR) and give the compiler and the flags: once installed the libraries
### and stubs are in libdir (a package in libdir/<package>) and the private headers in includedir,
### in the image as in the toolchain of the native build
TCL_LIBDIR=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
sed -e "s@${PKG_BLDPATH}/unix/pkgs/@${TCL_LIBDIR}/@g" \
	-e "s@${PKG_BLDPATH}/unix@${TCL_LIBDIR}@g" \
	-e "s@${PKG_SRCPATH}/pkgs/\([^/'\"]*\)/library@${TCL_LIBDIR}/\1@g" \
	-e "s@${PKG_SRCPATH}/pkgs/[^/'\"]*/generic@${INSTALL_INCLUDEDIR}@g" \
	-e "s@${PKG_SRCPATH}\(/pkgs/[^/'\"]*\)\{0,1\}@${INSTALL_INCLUDEDIR}@g" \
	-i "${PKG_PKGPATH}${TCL_LIBDIR}"/{tclConfig.sh,itcl*/itclConfig.sh,tdbc*/tdbcConfig.sh}
strip_host_paths "${PKG_PKGPATH}${TCL_LIBDIR}"/{tclConfig.sh,itcl*/itclConfig.sh,tdbc*/tdbcConfig.sh}
