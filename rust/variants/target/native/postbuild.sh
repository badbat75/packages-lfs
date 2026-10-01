# shellcheck shell=bash
# shellcheck disable=SC2154
# rust, target native and native-std: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH},
# set -ex). Replaces the postbuild.sh of the recipe.

### The components of the archive, into the Rust of the build machine
"${PKG_SRCPATH}/install.sh" --prefix="${INSTALL_PREFIX}" --components="${RUST_COMPONENTS}" --disable-ldconfig
