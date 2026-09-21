# shellcheck shell=bash
# shellcheck disable=SC2154
# gettext: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The tarball ships its whole gettext infrastructure: autopoint (the 0.23.1 of the toolchain) refuses
### the AM_GNU_GETTEXT calls of the package without 'external' and leaves autoreconf half-done, which
### make then tries to finish with the automake of the release. Skip autopoint and let autoreconf finish
AUTOPOINT=true autoreconf -fi
