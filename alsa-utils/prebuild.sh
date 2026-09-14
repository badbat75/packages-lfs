# shellcheck shell=bash
# shellcheck disable=SC2154
# alsa-utils: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

mkdir -pv ${PKG_BLDPATH}/include
    cp -pv ${PKG_SRCPATH}/include/os_compat.h ${PKG_BLDPATH}/include/os_compat.h
    sed -e 's/acp-pdm-dmic/acp-dmic-codec/'                   \
    -e '/LABEL="alsa_restore_go"/s/go/std/'               \
    -e '/^ENV.ALSA_CARD_NUMBER/i LABEL="alsa_restore_go"' \
    -i alsactl/90-alsa-restore.rules.in
