# shellcheck shell=bash
# shellcheck disable=SC2154
# vim: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

mkdir -pv ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}
	ln -sfv vim ${PKG_PKGPATH}${INSTALL_PREFIX}/bin/vi
	for L in ${PKG_PKGPATH}/usr/share/man/{,*/}man1/vim.1; do
    	ln -sfv vim.1 $(dirname $L)/vi.1
	done
	cat > ${PKG_PKGPATH}/etc/vimrc <<-EOF
		" Begin /etc/vimrc

		" Ensure defaults are set before customizing settings, not after
		source \$VIMRUNTIME/defaults.vim
		let skip_defaults_vim=1 

		set nocompatible
		set backspace=2
		set mouse=
		syntax on
		if (&term == "xterm") || (&term == "putty")
		set background=dark
		endif

		" End /etc/vimrc
	EOF

### efm_perl.pl gets the perl the build found (which.sh), lfs/perl5:native: the one of the image
sed -i "s#${GLOBAL_TOOLCHAIN_PATH}/perl5/bin/perl#${INSTALL_EXECPREFIX}/bin/perl#g" "${PKG_PKGPATH}${INSTALL_SHAREDIR}"/vim/vim*/tools/efm_perl.pl
