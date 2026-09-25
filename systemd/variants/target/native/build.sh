# shellcheck shell=bash
# shellcheck disable=SC2154
# systemd, target native: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}[/${CONF_PATH}], bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The build directory is a copy of the sources (custom): meson configures a directory below it
rm -rf build
meson setup build . --prefix=${INSTALL_PREFIX} --libdir=${INSTALL_LIBDIR} \
	-Dauto_features=disabled -Dmode=release -Dtests=false -Dinstall-tests=false \
	-Dlink-systemctl-shared=false
### The target of the library carries its version (libsystemd.so.0.44.0 in v261)
cd build
LIBSYSTEMD=$(ninja -t targets all | sed -n 's/^\(libsystemd\.so\.[0-9.]*\): c_LINKER$/\1/p')
ninja systemctl ${LIBSYSTEMD} src/libsystemd/libsystemd.pc

install -vDm755 systemctl ${INSTALL_EXECPREFIX}/bin/systemctl
install -vdm755 ${INSTALL_LIBDIR}/pkgconfig ${INSTALL_INCLUDEDIR}/systemd
cp -dv libsystemd.so libsystemd.so.[0-9] ${LIBSYSTEMD} ${INSTALL_LIBDIR}/
install -vm644 src/libsystemd/libsystemd.pc ${INSTALL_LIBDIR}/pkgconfig/
### The public headers (the list of src/systemd/meson.build) and _sd-common.h, which they include
for header in _sd-common.h $(sed -n "/^_systemd_headers = \[/,/^\]/ s/^ *'\(.*\)',\$/\1/p" ${PKG_SRCPATH}/src/systemd/meson.build)
do
	install -vm644 ${PKG_SRCPATH}/src/systemd/${header} ${INSTALL_INCLUDEDIR}/systemd/
done
