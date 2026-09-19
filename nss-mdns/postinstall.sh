# shellcheck shell=bash
# shellcheck disable=SC2154
# nss-mdns: post-install script, sourced as root inside the target chroot.

### The hosts line of the nsswitch.conf of lfs/glibc gets the module the README of nss-mdns suggests:
### .local names through avahi-daemon, and no DNS query for them when mDNS finds nothing
if ! grep -q '^hosts:.*mdns' ${INSTALL_SYSCONFDIR}/nsswitch.conf
then
	sed -i 's/^\(hosts:[[:space:]]*files\)/\1 mdns_minimal [NOTFOUND=return]/' ${INSTALL_SYSCONFDIR}/nsswitch.conf
fi
grep '^hosts:' ${INSTALL_SYSCONFDIR}/nsswitch.conf
