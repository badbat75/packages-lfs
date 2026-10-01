# shellcheck shell=bash
# shellcheck disable=SC2154
# GLib:bootstrap: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# shellcheck source=/dev/null
source "${PKG_RECIPEPATH}/variants/target/sysroot/postbuild.sh"
### Only what the builds over this one compile and link with stays: the libraries, the include files, the pc files,
### and the programs the pc files name (glib_mkenums, gdbus_codegen, glib_compile_resources...) with
### their data, which the meson gnome module of those builds runs
GLIB_PC_PROGRAMS="${INSTALL_SHAREDIR}/glib-2.0/*"
GLIB_PC_PROGRAMS+=" ${INSTALL_EXECPREFIX}/bin/gdbus ${INSTALL_EXECPREFIX}/bin/gdbus-codegen ${INSTALL_EXECPREFIX}/bin/gi-compile-repository ${INSTALL_EXECPREFIX}/bin/gio"
GLIB_PC_PROGRAMS+=" ${INSTALL_EXECPREFIX}/bin/gio-querymodules ${INSTALL_EXECPREFIX}/bin/glib-compile-resources ${INSTALL_EXECPREFIX}/bin/glib-compile-schemas ${INSTALL_EXECPREFIX}/bin/glib-genmarshal"
GLIB_PC_PROGRAMS+=" ${INSTALL_EXECPREFIX}/bin/glib-mkenums ${INSTALL_EXECPREFIX}/bin/gobject-query ${INSTALL_EXECPREFIX}/bin/gresource ${INSTALL_EXECPREFIX}/bin/gsettings"
split_install --keep-dev "${GLIB_PC_PROGRAMS}"
