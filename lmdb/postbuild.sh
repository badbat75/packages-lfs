# shellcheck shell=bash
# shellcheck disable=SC2154
# lmdb: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).

### "make all" writes lmdb.pc, "make install" leaves it behind: meson projects (bind9) look for it
install -vDm644 "${CONF_PATH}/lmdb.pc" "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/lmdb.pc"
