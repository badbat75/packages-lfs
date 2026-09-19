# shellcheck shell=bash
# shellcheck disable=SC2154
# bluez: post-install script, sourced as root inside the target chroot.

### bluetooth.service wants its configuration directory read-only (ConfigurationDirectoryMode=0555)
### while make install creates it 0755: systemd logged the difference at every start. The staging
### directory keeps 0755, which a build that does not run as root can still remove
chmod -v 555 ${INSTALL_SYSCONFDIR}/bluetooth
