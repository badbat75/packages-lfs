# shellcheck shell=bash
# shellcheck disable=SC2154
# shadow: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

/usr/sbin/pwconv
/usr/sbin/grpconv
/usr/sbin/useradd -D --gid 999
sed -i '/MAIL/s/yes/no/' ${INSTALL_SYSCONFDIR}/default/useradd
