# shellcheck shell=bash
# shellcheck disable=SC2154
# glibc, target cross: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).

mkdir -pv ${PKG_BLDPATH}
cat <<-EOF > ${PKG_BLDPATH}/configparms
	complocaledir=${TARGET_LIBDIR}/locale
	datadir=${TARGET_SHAREDIR}
EOF
