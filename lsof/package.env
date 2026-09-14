# lsof
PKG_VER=4.99.3
PKG_URL="https://github.com/lsof-org/lsof/archive/refs/tags/${PKG_VER}.tar.gz"
PKG_DEPS="lfs/libtirpc"
BUILD_PROCESS=custom

PKG_BUILDSCRIPT="LINUX_HASSELINUX=0 LSOF_CC=\"\${CC}\" LSOF_AR=\"\${AR} cr\" LSOF_RANLIB=\"\${RANLIB}\" LSOF_CFLAGS_OVERRIDE=1 \\
LSOF_CFGF=\"\${CFLAGS}\" LSOF_CFGL=\"\${LDFLAGS}\" \\
 ./Configure -n linux
make all
mkdir -pv \${PKG_PKGPATH}/usr/bin
install -v -m0755 -s --strip-program=${HARCH}-strip lsof \${PKG_PKGPATH}/usr/bin
mkdir -pv \${PKG_PKGPATH}/usr/share/man/man8
install -v Lsof.8 \${PKG_PKGPATH}/usr/share/man/man8
"
