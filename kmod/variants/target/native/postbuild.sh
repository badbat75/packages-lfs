# shellcheck shell=bash
# shellcheck disable=SC2154
# kmod, target native: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The tools are names of the kmod program, in the bin directory the builds have in their PATH
for target in depmod insmod lsmod modinfo modprobe rmmod
do
	ln -sfv kmod ${INSTALL_EXECPREFIX}/bin/${target}
done
