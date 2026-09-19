# shellcheck shell=bash
# shellcheck disable=SC2154
# nss-mdns: post-install script, sourced as root inside the target chroot.

### The module goes at the end of the hosts line of the nsswitch.conf of lfs/glibc, after dns, and
### without the [NOTFOUND=return] the README of nss-mdns suggests: a name is looked up in files,
### then in DNS, and only what neither answers goes to avahi over multicast. That order is what
### makes the .local domain a LAN serves over unicast DNS resolve, in about 20 ms, while the names
### that really are mDNS ones cost one DNS miss more (a few tens of ms). The other way round every
### name under .local pays the multicast timeout first, and with [NOTFOUND=return] the DNS server
### never sees it at all. The rule removes the module before appending it, so it also rewrites the
### line an earlier install of this package left, on a running system as well.
sed -i '/^hosts:/{s/[[:space:]]*mdns_minimal\([[:space:]]*\[NOTFOUND=return\]\)\?//; s/$/ mdns_minimal/}' ${INSTALL_SYSCONFDIR}/nsswitch.conf
grep '^hosts:' ${INSTALL_SYSCONFDIR}/nsswitch.conf
