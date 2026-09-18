# shellcheck shell=bash
# shellcheck disable=SC2154
### runprebuild.sh: cwd PKG_SRCPATH, set -x, no -e

### gudev/meson.build asks the linker for -export-dynamic through the compiler: gcc takes the option
### and passes it on, clang stops on an argument it does not know. The -Wl, form says the same to both
sed -i -e "s/'-export-dynamic'/'-Wl,--export-dynamic'/" gudev/meson.build
