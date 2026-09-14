# shellcheck shell=bash
# shellcheck disable=SC2154
# systemd: post-install script, sourced as root inside the target chroot.

case ${PKG_TARGET} in
	bootstrap) ;;
	*)
		mkdir -pv ${INSTALL_LOCALSTATEDIR}/log/journal
		journalctl --update-catalog
		# systemd-sysusers
		# systemd-tmpfiles --create

		systemd-machine-id-setup
		systemctl preset-all
		systemctl --global preset-all

		systemd-hwdb update
		/lib/systemd/systemd-random-seed save
	;;
esac
