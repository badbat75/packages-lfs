# shellcheck shell=bash
# shellcheck disable=SC2154
# rust: post-build script of the Rust of the image, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# The native targets carry their own script under variants/target/native.

### The components of the archive, into the staging directory
"${PKG_SRCPATH}/install.sh" --prefix="${INSTALL_PREFIX}" --destdir="${PKG_PKGPATH}" \
	--components="${RUST_COMPONENTS}" --disable-ldconfig
### The manifests uninstall.sh reads name the files with the staging directory: the paths of the image
### instead. install.log is the log of this install
sed -i "s|${PKG_PKGPATH}||g" "${PKG_PKGPATH}${INSTALL_LIBDIR}/rustlib/"manifest-*
rm -fv "${PKG_PKGPATH}${INSTALL_LIBDIR}/rustlib/install.log"
