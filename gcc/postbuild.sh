# shellcheck shell=bash
# shellcheck disable=SC2154
# gcc: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

eval export PKG_PKGPATH=${PKG_PKGPATH}
	mkdir -pv ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
	find ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/gcc/${HARCH} -type f,l \( -name "*.so*" -o -name "*.a*" -o -name "*.la*" -o -name "crt*.o" \) \
	| xargs -r -I{} bash -c "ln -fsv \$(realpath --relative-to=${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX} {}) ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/\$(basename {})"
