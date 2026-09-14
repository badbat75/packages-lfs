# shellcheck shell=bash
# shellcheck disable=SC2154
# openldap: post-install script, sourced as root inside the target chroot.

case ${PKG_TARGET} in
	bootstrap|client) ;;
	*)
		if ! getent group ldap; then
			groupadd --system -g 83 ldap
		fi
		if ! getent passwd ldap; then
			useradd --system -c "OpenLDAP Daemon Owner" -d /var/lib/openldap -u 83 -g ldap -s /sbin/nologin ldap
		fi
	;;
esac
