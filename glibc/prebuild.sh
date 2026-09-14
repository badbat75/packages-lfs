# shellcheck shell=bash
# shellcheck disable=SC2154
# glibc: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

mkdir -pv ${PKG_BLDPATH}
case ${PKG_TARGET} in
	cross)
		cat <<-EOF > ${PKG_BLDPATH}/configparms
			complocaledir=${TARGET_LIBDIR}/locale
			datadir=${TARGET_SHAREDIR}
		EOF
	;;
	stage1) ;;
	*)
		cat <<-EOF > ${PKG_BLDPATH}/configparms
			rootsbindir=${INSTALL_EXECPREFIX}/sbin
			complocaledir=${INSTALL_LIBDIR}/locale
			datadir=${INSTALL_SHAREDIR}
		EOF
	;;
esac
