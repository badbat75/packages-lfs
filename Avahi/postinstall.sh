# shellcheck shell=bash
# shellcheck disable=SC2154
# Avahi: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

if ! getent group avahi; then
    groupadd --system -fg 84 avahi
fi
if ! getent passwd avahi; then
    useradd --system -c "Avahi Daemon Owner" -d /run/avahi-daemon -u 84 -g avahi -s /sbin/nologin avahi
fi
