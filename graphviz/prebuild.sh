# shellcheck shell=bash
# shellcheck disable=SC2154
# graphviz: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### configure takes every feature of libgd for granted when pkg-config finds gdlib (gdlib.pc does not
### list them): the text went first to gdImageStringFTEx, which the libgd of lfs/libgd:native does not
### have, and dot exited with an error on every label. Its features are PNG alone
sed -i 's/GD_FEATURES="GD_PNG GD_JPEG GD_XPM GD_FONTCONFIG GD_FREETYPE"/GD_FEATURES="GD_PNG"/' configure
