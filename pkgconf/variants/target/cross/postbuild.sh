# shellcheck shell=bash
# shellcheck disable=SC2154
# pkgconf, target cross: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the recipe postbuild.sh. Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

ln -fsv ${HARCH}-pkgconf ${INSTALL_EXECPREFIX}/bin/${HARCH}-pkg-config
