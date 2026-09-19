# shellcheck shell=bash
# shellcheck disable=SC2154
# wpa_supplicant, target native: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -m755 -s -D wpa_supplicant/wpa_passphrase ${INSTALL_EXECPREFIX}/bin/wpa_passphrase
