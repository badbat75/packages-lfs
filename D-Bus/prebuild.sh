# shellcheck shell=bash
# shellcheck disable=SC2154
# D-Bus: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's/static dbus_bool_t fatal_warnings_on_check_failed = TRUE/static dbus_bool_t fatal_warnings_on_check_failed = FALSE/' -i dbus/dbus-internals.c
