# shellcheck shell=bash
# shellcheck disable=SC2154
# alsa-topology-conf: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -d -m0755 ${PKG_PKGPATH}${INSTALL_PREFIX}/share/alsa
	cp -RPv topology ${PKG_PKGPATH}${INSTALL_PREFIX}/share/alsa/
