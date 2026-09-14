# shellcheck shell=bash
# shellcheck disable=SC2154
# bind9: post-install script, sourced as root inside the target chroot.

case ${PKG_TARGET} in
	bootstrap) ;;
	*)
		if ! getent group named; then
			groupadd --system -g 20 named
		fi
		if ! getent passwd named; then
			useradd --system -c "BIND Owner" -g named -s /sbin/nologin -u 20 named
		fi
		install -d -m770 -o named -g named /srv/named
	;;
esac
