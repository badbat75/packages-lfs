# shellcheck shell=bash
# shellcheck disable=SC2154
# e2fsprogs:bootstrap: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only what the builds over this one compile and link with stays: the libraries, the include files, the pc files, and compile_et
### and mk_cmds with their data, which krb5 runs (--with-system-et, --with-system-ss)
split_install --keep-dev "${INSTALL_EXECPREFIX}/bin/compile_et ${INSTALL_EXECPREFIX}/bin/mk_cmds ${INSTALL_SHAREDIR}/et/* ${INSTALL_SHAREDIR}/ss/*"
