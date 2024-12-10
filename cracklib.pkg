# cracklib
PKG_VER=2.9.11
PKG_URL="https://github.com/cracklib/cracklib/archive/refs/tags/v${PKG_VER}.tar.gz"
PKG_DEPS="lfs/cracklib-words lfs/zlib"
BUILD_PROCESS=configmake
PKG_AUTOCONF=0
AUTOCONF_PATH=src
CONF_PATH=src
CONF_ENV="PYTHON=cross-python3"
CONF_FLAGS="--with-default-dict=${INSTALL_LIBDIR}/cracklib/pw_dict"
PKG_CPPFLAGS="-I\${SYSROOT}${INSTALL_INCLUDEDIR}/python${PYTHONBIN_VER}"
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="cd src
	sed -i '/AM_GNU_GETTEXT_VERSION/ s/0.17/0.20/g' configure.ac
	./autogen.sh
    sed -i '/skipping/d' util/packer.c
	#sed -i '15209 s/.*/am_cv_python_version=${PYTHONBIN_VER}/' configure
	"
PKG_POSTBUILD="install -v -m755 -d \${PKG_PKGPATH}${INSTALL_LIBDIR}/cracklib"