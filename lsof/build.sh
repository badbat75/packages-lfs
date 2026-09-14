# shellcheck shell=bash
# shellcheck disable=SC2154
# lsof: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}[/${CONF_PATH}], bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

LINUX_HASSELINUX=0 LSOF_CC="${CC}" LSOF_AR="${AR} cr" LSOF_RANLIB="${RANLIB}" LSOF_CFLAGS_OVERRIDE=1 \
LSOF_CFGF="${CFLAGS}" LSOF_CFGL="${LDFLAGS}" \
 ./Configure -n linux
make all
mkdir -pv ${PKG_PKGPATH}/usr/bin
install -v -m0755 -s --strip-program=${HARCH}-strip lsof ${PKG_PKGPATH}/usr/bin
mkdir -pv ${PKG_PKGPATH}/usr/share/man/man8
install -v Lsof.8 ${PKG_PKGPATH}/usr/share/man/man8
