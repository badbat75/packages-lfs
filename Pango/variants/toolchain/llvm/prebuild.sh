# shellcheck shell=bash
# shellcheck disable=SC2154
### runprebuild.sh: cwd PKG_SRCPATH, set -x, no -e

### meson.build asks for -Werror=unused-but-set-variable, and clang counts under it the
### <type>_parent_class that G_DEFINE_TYPE defines (-Wunused-but-set-global) when the type never chains
### up to its parent: a variable of the macro of GLib, which gcc does not look at. The flags of the
### project follow the ones of the framework on the command line, so a -Wno- of the recipe never wins
sed -i -e "/'-Werror=unused-but-set-variable',/d" meson.build
