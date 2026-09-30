# shellcheck shell=bash
# shellcheck disable=SC2154
# shared-mime-info: post-install script, sourced as root inside the target chroot.

### The MIME database of every package installed in the image
update-mime-database -V ${INSTALL_SHAREDIR}/mime
