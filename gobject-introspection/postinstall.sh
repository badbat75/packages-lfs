# shellcheck shell=bash
# shellcheck disable=SC2154
# gobject-introspection: post-install script, sourced as root inside the target chroot.

if [ -f ${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/gobject-introspection-1.0.pc ]; then
	sed '/g_ir_/ s/.cross$//' -i ${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/gobject-introspection-1.0.pc
fi
rm -fv ${INSTALL_EXECPREFIX}/bin/g-ir-*.cross
