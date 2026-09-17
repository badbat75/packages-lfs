# shellcheck shell=bash
# shellcheck disable=SC2154
# gobject-introspection, target cross: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the recipe postbuild.sh. Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

patchelf --set-rpath "${INSTALL_LIBDIR}" \
	"${INSTALL_EXECPREFIX}"/bin/g-ir-{compiler,generate,inspect} \
	"$(find "${INSTALL_LIBDIR}/gobject-introspection/giscanner" -name "_giscanner.cpython-*.so")"
