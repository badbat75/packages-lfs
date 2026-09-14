# shellcheck shell=bash
# shellcheck disable=SC2154
# make-ca: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

systemctl enable update-pki.timer
