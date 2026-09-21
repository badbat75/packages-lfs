# Set up i18n variables
# /etc/locale.conf is the file systemd reads the system locale from: sourcing it here gives the
# login shells the same one, instead of the POSIX locale the commented template left them in
if [ -r /etc/locale.conf ]
then
	. /etc/locale.conf
	export LANG
	[ -n "${LC_ALL:-}" ] && export LC_ALL
fi
