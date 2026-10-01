# shellcheck shell=bash
# shellcheck disable=SC2154
# krb5:lib: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# shellcheck source=/dev/null
source "${PKG_RECIPEPATH}/prebuild.sh"
### Only the libraries, the plugins of the clients, krb5-config, the example configuration, the
### manual pages and the translations are built: not the KDC, kadmin, kprop, the clients, the tests
sed -e '/^SUBDIRS=/ s/$/\n__BEGIN_DELETE/' \
	-e '/^WINSUBDIRS=/ s/^/__END_DELETE\n/' -i src/Makefile.in
sed '/^__BEGIN_DELETE/,/^__END_DELETE/d' -i src/Makefile.in
sed 's@^SUBDIRS=.*@SUBDIRS=util include lib plugins/preauth/otp plugins/preauth/pkinit plugins/preauth/spake plugins/tls/k5tls build-tools config-files man \@po\@@' -i src/Makefile.in
