# openldap
PKG_VER=2.6.8
PKG_URL="https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${PKG_VER}.tgz"
PKG_DEPS="lfs/openssl"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
		CONF_FLAGS="--enable-dynamic"
		CONF_FLAGS+=" --enable-versioning=yes"
		CONF_FLAGS+=" --disable-debug"
		CONF_FLAGS+=" --with-tls=openssl"
		CONF_FLAGS+=" --with-yielding_select=yes"
case ${HM} in
	arm|aarch64|x86_64) CONF_VARS="ac_cv_func_memcmp_working=yes" ;;
esac
case ${PKG_TARGET} in
	bootstrap)
		CONF_FLAGS+=" --disable-slapd"
		PKG_PREBUILD="sed 's/^SUBDIRS=.*/SUBDIRS= include libraries/' -i Makefile.in"
		PKG_MAKETARGETS="install"
	;;
	client)
		PKG_DEPS+=" lfs/cyrus-sasl"
		CONF_FLAGS+=" --disable-slapd"
		#PKG_MAKETARGETS="all,install"
	;;
	*)
		PKG_DEPS+=" lfs/cyrus-sasl"
		CONF_FLAGS+=" --with-cyrus-sasl"
		CONF_FLAGS+=" --enable-crypt"
		CONF_FLAGS+=" --enable-spasswd"
		CONF_FLAGS+=" --enable-slapd"
		CONF_FLAGS+=" --enable-modules"
		CONF_FLAGS+=" --enable-rlookups"
		CONF_FLAGS+=" --enable-backends=mod"
		CONF_FLAGS+=" --disable-sql"
		CONF_FLAGS+=" --disable-wt"
		CONF_FLAGS+=" --enable-overlays=mod"
		#PKG_MAKETARGETS="all,install"
		PKG_POSTINSTALL="if ! getent group ldap; then
	groupadd --system -g 83 ldap
fi
if ! getent passwd ldap; then
	useradd --system -c \"OpenLDAP Daemon Owner\" -d /var/lib/openldap -u 83 -g ldap -s /sbin/nologin ldap
fi"
	;;
esac

case ${TOOLCHAIN} in
	llvm) PKG_CFLAGS="-Wno-int-conversion -Wno-deprecated-non-prototype" ;;
esac
