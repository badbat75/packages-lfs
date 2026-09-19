# shellcheck shell=bash
# shellcheck disable=SC2154
# wpa_supplicant, target native: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# Only wpa_passphrase is built: the internal crypto, with libtommath built in, needs no library
cat > wpa_supplicant/.config <<-EOF
	CONFIG_TLS=internal
	CONFIG_INTERNAL_LIBTOMMATH=y
EOF
