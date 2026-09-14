# shellcheck shell=bash
# shellcheck disable=SC2154
# D-Bus: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

ln -sfv /etc/machine-id ${INSTALL_LOCALSTATEDIR}/lib/dbus/machine-id
chown -v root:messagebus ${INSTALL_PREFIX}/libexec/dbus-daemon-launch-helper
chmod -v 4750 ${INSTALL_PREFIX}/libexec/dbus-daemon-launch-helper
systemctl preset dbus.socket
systemctl --global preset dbus.socket
systemctl preset dbus.service
systemctl --global preset dbus.service
