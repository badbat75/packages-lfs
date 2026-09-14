# shellcheck shell=bash
# shellcheck disable=SC2154
# create-base-fs_1.0: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

chgrp -v utmp /var/log/lastlog
