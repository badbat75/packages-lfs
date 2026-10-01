# shellcheck shell=bash
# shellcheck disable=SC2154
# openldap, target server or the whole OpenLDAP: post-install script, sourced as root inside the
# target chroot.

if ! getent group ldap; then
	groupadd --system -g 83 ldap
fi
if ! getent passwd ldap; then
	useradd --system -c "OpenLDAP Daemon Owner" -d /var/lib/openldap -u 83 -g ldap -s /sbin/nologin ldap
fi
