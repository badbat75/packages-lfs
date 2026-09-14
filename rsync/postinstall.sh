# shellcheck shell=bash
# shellcheck disable=SC2154
# rsync: post-install script, sourced as root inside the target chroot.
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

if ! getent group rsyncd; then
    groupadd --system -fg 48 rsyncd
fi
if ! getent passwd rsyncd; then
    useradd --system -c "rsyncd Daemon" -d /home/rsync -u 48 -g rsyncd -s /sbin/nologin rsyncd
fi
systemctl disable rsyncd.service
