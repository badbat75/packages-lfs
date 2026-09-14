# shellcheck shell=bash
# shellcheck disable=SC2154
# krb5: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i 's/(MAKE) install INSTALL_STRIP=-s/(MAKE) install INSTALL_STRIP='\''-s --strip-program=\$(STRIP)'\''/g' src/Makefile.in
	sed -i -e '/eq 0/{N;s/12 //}'    src/plugins/kdb/db2/libdb2/test/run.test
	sed -i '/t_kadm5.py/d'           src/lib/kadm5/Makefile.in
case ${PKG_TARGET} in
	bootstrap)
		sed -e '/^SUBDIRS=/ s/$/\n__BEGIN_DELETE/' \
			-e '/^WINSUBDIRS=/ s/^/__END_DELETE\n/' -i src/Makefile.in
		sed '/^__BEGIN_DELETE/,/^__END_DELETE/d' -i src/Makefile.in
		sed 's/^SUBDIRS=.*/SUBDIRS=util include lib build-tools/' -i src/Makefile.in
	;;
esac
