# shellcheck shell=bash
# shellcheck disable=SC2154
# Avahi: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed '426a if (events & AVAHI_WATCH_HUP) { \
client_free(c); \
return; \
}' -i avahi-daemon/simple-protocol.c
