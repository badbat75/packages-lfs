# shellcheck shell=bash
# shellcheck disable=SC2154
# tpm2-tss: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

if ! getent group tss; then
	groupadd --system tss
fi

if ! getent passwd tss; then
	useradd --system -c "Account used for TPM access" -d /dev/null -g tss -s /sbin/nologin tss
fi
