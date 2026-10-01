# shellcheck shell=bash
# shellcheck disable=SC2154
# bind9:server: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### What lfs/bind9:lib and lfs/bind9:client install goes: the libraries, the client tools and their
### manual pages
rm -fv "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"/lib*.so
for NAME in ${BIND_CLIENT_PROGRAMS}
do
	rm -fv "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/${NAME}" "${PKG_PKGPATH}${INSTALL_SHAREDIR}/man/man1/${NAME}.1"
done
