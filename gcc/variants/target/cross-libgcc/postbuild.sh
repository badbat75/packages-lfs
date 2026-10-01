# shellcheck shell=bash
# shellcheck disable=SC2154
# gcc, target cross-libgcc: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the postbuild.sh of target/cross.

### The tree was configured by gcc:cross: the compilers and flags of this environment stay out of it
# shellcheck disable=SC2046
unset $( sed -n 's/^export \([A-Za-z_0-9]*\)=.*/\1/p' "${PKG_BLDPATH}/environment.source" | grep -vx -e PATH -e LC_ALL )
cd "${GCC_CROSS_BLDPATH}"
make V="${MAKEVERBOSE:-0}" STAGE_CC_WRAPPER="${GCC_STAGE_CC_WRAPPER}" all-target-libgcc
make V="${MAKEVERBOSE:-0}" STAGE_CC_WRAPPER="${GCC_STAGE_CC_WRAPPER}" install-strip-target-libgcc
rm -fv "${INSTALL_PREFIX}/lib/gcc/${HARCH}/${GCC_MAJVER}/"*.la
