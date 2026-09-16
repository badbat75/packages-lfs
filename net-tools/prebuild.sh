# shellcheck shell=bash
# shellcheck disable=SC2154
# net-tools: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# NET/ROM and Rose left the kernel (no linux/netrom.h and linux/rose.h in the 7.2 headers):
# their protocol families and hardware types default to no before the interactive config
sed -i -e '/HAVE_AFNETROM y$/ s/ y$/ n/' -e '/HAVE_AFROSE y$/ s/ y$/ n/' \
	-e '/HAVE_HWNETROM y$/ s/ y$/ n/' -e '/HAVE_HWROSE y$/ s/ y$/ n/' config.in
yes '' | make config
