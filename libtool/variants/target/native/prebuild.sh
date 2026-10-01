# shellcheck shell=bash
# shellcheck disable=SC2154
# libtool, target native: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The ltmain.sh the builds get from libtoolize passes to the compiler of the link the flags it would
### drop otherwise: --sysroot, the optimization, debug and LTO flags, -fuse-ld, -specs, the sanitizers,
### --target, -B. Idempotent: the list is replaced after the marker
LTMAIN=$(find . -name ltmain.sh -path '*build-aux*' | head -n1)
if ! grep -q '^## BBXB change ##' "${LTMAIN}"
then
	sed -i '/^      -64|-mips\[0-9\]/ i## BBXB change ##' "${LTMAIN}"
	sed -i '/^      -64|-mips\[0-9\]/,/*)$/d' "${LTMAIN}"
	sed -i '/^## BBXB change ##/a\       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*|-t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*|-O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-specs=*|-fsanitize=*|-fuse-ld=*|-Wa,*|--target=*|-B*)' "${LTMAIN}"
fi
