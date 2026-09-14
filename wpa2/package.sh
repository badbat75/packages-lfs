# wpa2
PKG_VER=2.11
PKG_URL="https://w1.fi/cgit/hostap/snapshot/hostap_$(echo ${PKG_VER} | sed 's/\./_/g').tar.gz"
#PKG_URL="https://w1.fi/cgit/hostap/snapshot/hostap-bb945b98fefc64887dffb40773a19d77585cee42.tar.bz2"

case ${PKG_TARGET} in
	wpa_supplicant)
		BUILD_PROCESS=simplemake
		PKG_MAKETARGETS="all"
		PKG_DEPS="lfs/D-Bus lfs/ncurses lfs/readline lfs/libnl lfs/openssl lfs/pcsc-lite firmwares/wireless-regdb"
		PKG_MAKEVARS="PREFIX=${INSTALL_PREFIX} INCDIR=${INSTALL_INCLUDEDIR} BINDIR=/sbin -C wpa_supplicant"
		PKG_CFLAGS="-I\${SYSROOT}${INSTALL_INCLUDEDIR}/PCSC"
		PKG_CFLAGS+=" -Wno-deprecated-declarations"

		PKG_PREBUILD="cat > wpa_supplicant/.config <<-EOF
				CONFIG_DRIVER_WEXT=y
				CONFIG_DRIVER_NL80211=y
				CONFIG_DRIVER_NL80211_QCA=y
				CONFIG_LIBNL32=y
				CONFIG_DRIVER_WIRED=y
				CONFIG_DRIVER_MACSEC_LINUX=y
				CONFIG_DRIVER_NONE=y
				CONFIG_IEEE8021X_EAPOL=y
				CONFIG_EAP_MD5=y
				CONFIG_EAP_MSCHAPV2=y
				CONFIG_EAP_TLS=y
				CONFIG_EAP_PEAP=y
				CONFIG_EAP_TTLS=y
				CONFIG_EAP_FAST=y
				CONFIG_EAP_GTC=y
				CONFIG_EAP_OTP=y
				CONFIG_EAP_SIM=y
				CONFIG_EAP_PSK=y
				CONFIG_EAP_PWD=y
				CONFIG_EAP_PAX=y
				CONFIG_EAP_LEAP=y
				CONFIG_EAP_AKA=y
				CONFIG_EAP_AKA_PRIME=y
				CONFIG_EAP_SAKE=y
				CONFIG_EAP_GPSK=y
				CONFIG_EAP_GPSK_SHA256=y
				CONFIG_EAP_TNC=y
				CONFIG_WPS=y
				CONFIG_WPS_ER=y
				CONFIG_WPS_REG_DISABLE_OPEN=y
				CONFIG_WPS_NFC=y
				CONFIG_EAP_IKEV2=y
				CONFIG_EAP_EKE=y
				CONFIG_MACSEC=y
				CONFIG_PKCS12=y
				CONFIG_SMARTCARD=y
				CONFIG_PCSC=y
				CONFIG_HT_OVERRIDES=y
				CONFIG_VHT_OVERRIDES=y
				CONFIG_EAPOL_TEST=y
				CONFIG_CTRL_IFACE=y
				CONFIG_READLINE=y
				CONFIG_SAE=y
				CONFIG_SUITEB=y
				CONFIG_SUITEB192=y
				CONFIG_BACKEND=file
				CONFIG_MAIN=main
				CONFIG_OS=unix
				CONFIG_ELOOP=eloop
				CONFIG_L2_PACKET=linux
				CONFIG_IEEE80211W=y
				CONFIG_TLS=openssl
				CONFIG_TLSV11=y
				CONFIG_TLSV12=y
				CONFIG_TLS_DEFAULT_CIPHERS="DEFAULT@SECLEVEL=1"
				CONFIG_IEEE80211R=y
				CONFIG_DEBUG_FILE=y
				CONFIG_DEBUG_SYSLOG=y
				CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
				CONFIG_DEBUG_LINUX_TRACING=y
				CONFIG_DELAYED_MIC_ERROR_REPORT=y
				CONFIG_GETRANDOM=y
				CONFIG_IEEE80211N=y
				CONFIG_IEEE80211AC=y
				CONFIG_INTERWORKING=y
				CONFIG_HS20=y
				CONFIG_AP=y
				CONFIG_P2P=y
				CONFIG_TDLS=y
				CONFIG_WIFI_DISPLAY=y
				CONFIG_AUTOSCAN_EXPONENTIAL=y
				CONFIG_AUTOSCAN_PERIODIC=y
				CONFIG_FST=y
				CONFIG_ACS=y
				CONFIG_IBSS_RSN=y
				CONFIG_PMKSA_CACHE_EXTERNAL=y
				CONFIG_BGSCAN_SIMPLE=y
				CONFIG_BGSCAN_LEARN=y
				CONFIG_OWE=y
				CONFIG_DPP=y
			EOF
			"

		PKG_POSTBUILD="mkdir -pv \${PKG_PKGPATH}/sbin \${PKG_PKGPATH}/lib/systemd/system
			install -d \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/wpa_supplicant
			install -v -m755 -s --strip-program=${HARCH:+${HARCH}-}strip -D wpa_supplicant/{wpa_cli,wpa_passphrase,wpa_supplicant} \${PKG_PKGPATH}/sbin/
			install -vdm755 \${PKG_PKGPATH}${INSTALL_PREFIX}/lib/pm-utils/sleep.d
			install -v -m644 -D wpa_supplicant/examples/60_wpa_supplicant \${PKG_PKGPATH}${INSTALL_PREFIX}/lib/pm-utils/sleep.d/
			install -v -m644 -D wpa_supplicant/systemd/*.service \${PKG_PKGPATH}/lib/systemd/system/"

		if false
		then
			PKG_POST_BUILD+=";make -C wpa_supplicant/doc/docbook
				cp wpa_supplicant/doc/docbook/wpa_background.8 \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man8/ && gzip -f \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man8/wpa_background.8
				cp wpa_supplicant/doc/docbook/wpa_cli.8 \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man8/ && gzip -f \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man8/wpa_cli.8
				cp wpa_supplicant/doc/docbook/wpa_passphrase.8 \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man8/ && gzip -f \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man8/wpa_passphrase.8
				cp wpa_supplicant/doc/docbook/wpa_supplicant.8 \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man8/ && gzip -f \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man8/wpa_supplicant.8
				cp wpa_supplicant/doc/docbook/wpa_supplicant.conf.5 \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man5/ && gzip -f \${PKG_PKGPATH}\${INSTALL_PREFIX}/share/man/man5/wpa_supplicant.conf.5"
		fi

		# Bug in Fedora OpenJade
		if test_version $(cat /dev/null | openjade -vh 2>&1 | head -n 1 | awk '{print $4}' | sed 's|\"||g') -le 1.3.2
		then
			PKG_PREBUILD+="
				sed -i 's/mv index.html/mv r1.html/' wpa_supplicant/doc/docbook/Makefile
				${PKG_PREBUILD}"
		fi

		### DBus Configuration
		PKG_DEPS+=" lfs/D-Bus"
		PKG_PREBUILD+="cat >> wpa_supplicant/.config <<-EOF
			CONFIG_CTRL_IFACE_DBUS_NEW=y
			CONFIG_CTRL_IFACE_DBUS_INTRO=y
		EOF
		"
		PKG_POSTBUILD+=";install -vdm755 \${PKG_PKGPATH}${INSTALL_PREFIX}/share/dbus-1/system-services
			install -v -m644 -D wpa_supplicant/dbus/fi.*.service \${PKG_PKGPATH}${INSTALL_PREFIX}/share/dbus-1/system-services/
			install -vdm755 \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/dbus-1/system.d
			install -v -m644 -D wpa_supplicant/dbus/dbus-wpa_supplicant.conf \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/dbus-1/system.d/wpa_supplicant.conf"

		PKG_POSTINSTALL="# create bluetooth group if not already present
if ! getent group netdev > /dev/null; then
	groupadd --system netdev
fi
		systemctl disable wpa_supplicant"
	;;
	hostapd)
		BUILD_PROCESS=simplemake
		PKG_MAKETARGETS="all"
		PKG_DEPS="lfs/libnl"
		PKG_MAKEVARS="PREFIX=${INSTALL_PREFIX} INCDIR=${INSTALL_INCLUDEDIR} BINDIR=${INSTALL_PREFIX}/sbin -C hostapd"
		PKG_PREBUILD="cat > hostapd/.config <<-EOF
				CONFIG_DRIVER_HOSTAP=y
				CONFIG_DRIVER_WIRED=y
				CONFIG_DRIVER_NL80211=y
				CONFIG_LIBNL32=y
				CONFIG_DRIVER_NONE=y
				CONFIG_IAPP=y
				CONFIG_RSN_PREAUTH=y
				CONFIG_IEEE80211W=y
				CONFIG_EAP=y
				CONFIG_ERP=y
				CONFIG_EAP_MD5=y
				CONFIG_EAP_TLS=y
				CONFIG_EAP_MSCHAPV2=y
				CONFIG_EAP_PEAP=y
				CONFIG_EAP_GTC=y
				CONFIG_EAP_TTLS=y
				CONFIG_EAP_SIM=y
				CONFIG_EAP_AKA=y
				CONFIG_EAP_AKA_PRIME=y
				CONFIG_EAP_PAX=y
				CONFIG_EAP_PSK=y
				CONFIG_EAP_PWD=y
				CONFIG_EAP_SAKE=y
				CONFIG_EAP_GPSK=y
				CONFIG_EAP_GPSK_SHA256=y
				CONFIG_EAP_FAST=y
				CONFIG_WPS=y
				CONFIG_WPS_UPNP=y
				CONFIG_WPS_NFC=y
				CONFIG_EAP_IKEV2=y
				CONFIG_EAP_TNC=y
				CONFIG_EAP_EKE=y
				CONFIG_PKCS12=y
				CONFIG_RADIUS_SERVER=y
				CONFIG_IPV6=y
				CONFIG_IEEE80211R=y
				CONFIG_IEEE80211N=y
				CONFIG_WNM=y
				CONFIG_IEEE80211AC=y
				CONFIG_DEBUG_FILE=y
				CONFIG_DEBUG_LINUX_TRACING=y
				CONFIG_FULL_DYNAMIC_VLAN=y
				CONFIG_VLAN_NETLINK=y
				EOF
			"
		PKG_POSTBUILD="install -d \${PKG_PKGPATH}${INSTALL_PREFIX}/sbin
			install -d \${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man1
			install -d \${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man8
			install --mode=755 -s --strip-program=${HARCH:+${HARCH}-}strip -D hostapd/hostapd \${PKG_PKGPATH}${INSTALL_EXECPREFIX}/sbin/
			install --mode=755 -s --strip-program=${HARCH:+${HARCH}-}strip -D hostapd/hostapd_cli \${PKG_PKGPATH}${INSTALL_EXECPREFIX}/sbin/
			install -d \${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man{5,8}
			cp hostapd/hostapd.8 \${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man8/ && gzip -f \${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man8/hostapd.8
			cp hostapd/hostapd_cli.1 \${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man5/ && gzip -f \${PKG_PKGPATH}${INSTALL_PREFIX}/share/man/man5/hostapd_cli.1

			mkdir -pv \${PKG_PKGPATH}/lib/systemd/system
			cat > \${PKG_PKGPATH}/lib/systemd/system/hostapd.service <<-EOF
				[Unit]
				Description=Access point and authentication server for Wi-Fi and Ethernet
				Documentation=man:hostapd(8)
				After=network.target

				[Service]
				Type=forking
				PIDFile=/run/hostapd.pid
				Restart=on-failure
				RestartSec=2
				Environment=DAEMON_CONF=/etc/hostapd/hostapd.conf
				EnvironmentFile=-/etc/default/hostapd
				ExecStart=/usr/sbin/hostapd -B -P /run/hostapd.pid -B \\\$DAEMON_OPTS \\\${DAEMON_CONF}

				[Install]
				WantedBy=multi-user.target
			EOF
			cat > \${PKG_PKGPATH}/lib/systemd/system/hostapd\@.service <<-EOF
				[Unit]
				Description=Access point and authentication server for Wi-Fi and Ethernet (%I)
				Documentation=man:hostapd(8)
				After=network.target
				BindsTo=sys-subsystem-net-devices-%i.device

				[Service]
				Type=forking
				PIDFile=/run/hostapd.%i.pid
				Restart=on-failure
				RestartSec=2
				EnvironmentFile=-/etc/default/hostapd
				ExecStart=/usr/sbin/hostapd -B -P /run/hostapd.%i.pid \\\$DAEMON_OPTS /etc/hostapd/%i.conf

				[Install]
				WantedBy=multi-user.target sys-subsystem-net-devices-%i.device
			EOF

			mkdir -pv \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/default
			cat > \${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/default/hostapd <<-EOF
				# Defaults for hostapd initscript
				#
				# WARNING: The DAEMON_CONF setting has been deprecated and will be removed
				#          in future package releases.
				#
				# See /usr/share/doc/hostapd/README.Debian for information about alternative
				# methods of managing hostapd.
				#
				# Uncomment and set DAEMON_CONF to the absolute path of a hostapd configuration
				# file and hostapd will be started during system boot. An example configuration
				# file can be found at /usr/share/doc/hostapd/examples/hostapd.conf.gz
				#
				#DAEMON_CONF=\"\"

				# Additional daemon options to be appended to hostapd command:-
				#       -d   show more debug messages (-dd for even more)
				#       -K   include key data in debug messages
				#       -t   include timestamps in some debug messages
				#
				# Note that -B (daemon mode) and -P (pidfile) options are automatically
				# configured by the init.d script and must not be added to DAEMON_OPTS.
				#
				#DAEMON_OPTS=\"\"
			EOF
			"
		PKG_POSTINSTALL="systemctl disable hostapd.service"
	;;
	*)
		BUILD_PROCESS=downloadonly
	;;
esac
