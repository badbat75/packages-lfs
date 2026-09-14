# shellcheck shell=bash
# shellcheck disable=SC2154
# p11-kit: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

if [ -f trust/trust-extract-compat.orig ]
		then
			mv trust/trust-extract-compat.orig rust/trust-extract-compat 
		fi
		cp -f trust/trust-extract-compat trust/trust-extract-compat.orig
		sed '20,$ d' -i trust/trust-extract-compat &&
		cat >> trust/trust-extract-compat <<-EOF
		# Copy existing anchor modifications to /etc/ssl/local
		/usr/libexec/make-ca/copy-trust-modifications

		# Generate a new trust store
		/usr/sbin/make-ca -f -g
	EOF
