# shellcheck shell=bash
# shellcheck disable=SC2154
# nss-mdns: post-install script, sourced as root inside the target chroot.

### The hosts line of the nsswitch.conf of lfs/glibc resolves .local names through avahi-daemon
### before DNS. The [NOTFOUND=return] the README of nss-mdns suggests is left out on purpose: it
### stops the lookup of every .local name mDNS does not answer, and a LAN whose DNS server serves a
### .local domain of its own (a common home router setup) then has no reachable host name. The cost
### is one multicast query that finds nothing before DNS answers those names.
if grep -q '^hosts:.*mdns' ${INSTALL_SYSCONFDIR}/nsswitch.conf
then
	### An earlier install of this package wrote that [NOTFOUND=return]: take it out
	sed -i 's/^\(hosts:.*mdns_minimal\)[[:space:]]*\[NOTFOUND=return\]/\1/' ${INSTALL_SYSCONFDIR}/nsswitch.conf
else
	sed -i 's/^\(hosts:[[:space:]]*files\)/\1 mdns_minimal/' ${INSTALL_SYSCONFDIR}/nsswitch.conf
fi
grep '^hosts:' ${INSTALL_SYSCONFDIR}/nsswitch.conf
