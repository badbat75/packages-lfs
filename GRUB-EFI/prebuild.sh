# shellcheck shell=bash
# shellcheck disable=SC2154
# GRUB-EFI: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

echo depends bli part_gpt > grub-core/extra_deps.lst
