# shellcheck shell=bash
# shellcheck disable=SC2154
# bind9:client: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the client tools and their manual pages stay
KEEP=()
for NAME in ${BIND_CLIENT_PROGRAMS}
do
	KEEP+=( ! -path "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/${NAME}" ! -path "${PKG_PKGPATH}${INSTALL_SHAREDIR}/man/man1/${NAME}.1" )
done
find "${PKG_PKGPATH}" ! -type d "${KEEP[@]}" -exec rm -fv {} +
find "${PKG_PKGPATH}" -mindepth 1 -type d -empty -delete
