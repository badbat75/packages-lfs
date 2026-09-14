# shellcheck shell=bash
# shellcheck disable=SC2154
# ghostscript: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -m644 base/*.h ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/ghostscript &&
ln -sfvn ghostscript ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}//ps
mv -v ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/ghostscript/${PKG_VER} ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/ghostscript-${PKG_VER}  &&
rm -rfv ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/ghostscript &&
cp -r examples/ ${PKG_PKGPATH}${INSTALL_SHAREDIR}/ghostscript/${PKG_VER}
