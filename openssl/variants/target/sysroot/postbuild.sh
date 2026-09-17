# shellcheck shell=bash
# shellcheck disable=SC2154
# openssl, target builds: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Configure has no option against the static libraries: they go when the project builds none, as
### --disable-static does for the other packages. With LTO their objects hold the build directory,
### which gcc records for the source files a build names by a relative path
if [ "${PKG_OVERRIDESTATIC:-${BUILD_LIBSTATIC}}" -eq 0 ]
then
	rm -v "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"/lib{crypto,ssl}.a
fi
