# shellcheck shell=bash
# shellcheck disable=SC2154
# bind9: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

cat > bbxb-krb5.ini <<-EOF
	[binaries]
	krb5-config = '${SYSROOT}${INSTALL_EXECPREFIX}/bin/krb5-config'
EOF
