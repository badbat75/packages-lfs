# shellcheck shell=bash
# shellcheck disable=SC2154
# glibc: pre-build script of the sysroot glibc, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# The cross and stage1 targets carry their own script under variants/target/.

mkdir -pv ${PKG_BLDPATH}
cat <<-EOF > ${PKG_BLDPATH}/configparms
	rootsbindir=${INSTALL_EXECPREFIX}/sbin
	complocaledir=${INSTALL_LIBDIR}/locale
	datadir=${INSTALL_SHAREDIR}
EOF
