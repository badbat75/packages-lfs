# shellcheck shell=bash
# shellcheck disable=SC2154
# wireless-tools: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i -e 's/^CC =/CC ?=/' -e 's/^AR =/AR ?=/' -e 's/^RANLIB =/RANLIB ?=/' Makefile
    sed -i '/^INSTALL_LIB=/ s|/lib/$|/lib${HARCH_LIB}${INSTALL_LIBSUFFIX}/|' Makefile
