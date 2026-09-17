# shellcheck shell=bash
# shellcheck disable=SC2154
# libxslt: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### xslt-config and xsltConf.sh give the flags of libxml2 as pkg-config returned them, with the sysroot
strip_host_paths "${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/xslt-config" \
	"${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/xsltConf.sh"
### The python module (libxsltmod) needs no libtool archive, whose dependency_libs name the gcc
### library directory of the toolchain
rm -fv "${PKG_PKGPATH}${INSTALL_EXECPREFIX}"/lib/python3*/site-packages/*.la
