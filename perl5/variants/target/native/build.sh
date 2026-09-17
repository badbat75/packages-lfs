# shellcheck shell=bash
# shellcheck disable=SC2154
# perl5, target native: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}, bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

	### Configure takes the compiler and its flags from -D options, not from the environment;
	### -Dmksymlinks builds out of the source tree
	sh "${PKG_SRCPATH}/Configure" -des -Dmksymlinks \
		-Dprefix="${INSTALL_PREFIX}/perl5" \
		-Dcc="${CC}" \
		-Doptimize="-O2" \
		-Dusethreads \
		-Dman1dir=none \
		-Dman3dir=none \
		-Dmyhostname=localhost \
		-Dperladmin=root@localhost
	make
	### A version change leaves no library directory of the old perl behind
	rm -rf "${INSTALL_PREFIX}/perl5"
	make install
