# bzip2
PKG_VER=1.0.8
PKG_URL="https://sourceware.org/pub/bzip2/bzip2-${PKG_VER}.tar.gz"
PKG_CFLAGS="-fpic -fPIC -D_FILE_OFFSET_BITS=64"
BUILD_PROCESS=simplemake
PKG_MAKEVARS=""
#PKG_MAKETARGETS="all,install"

PKG_PREBUILD="cat <<EOF | patch -s -p1 || true
--- a/Makefile-libbz2_so	2021-02-23 18:10:26.340000000 +0100
+++ b/Makefile-libbz2_so	2021-02-23 18:12:56.520000000 +0100
@@ -35,7 +35,7 @@
       bzlib.o
 
 all: \\\$(OBJS)
-	\\\$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.8 \\\$(OBJS)
-	\\\$(CC) \\\$(CFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.8
+	\\\$(CC) \\\$(CFLAGS) \\\$(LDFLAGS) -shared -Wl,-soname -Wl,libbz2.so.1 -o libbz2.so.1.0.8 \\\$(OBJS)
+	\\\$(CC) \\\$(CFLAGS) \\\$(LDFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.8
 	rm -f libbz2.so.1.0
 	ln -s libbz2.so.1.0.8 libbz2.so.1.0

EOF

	[ ! -f Makefile-libbz2_a ] && mv Makefile Makefile-libbz2_a || true
	sed -i -e 's/^CC=/CC?=/' -e 's/^AR=/AR?=/' -e 's/^RANLIB=/RANLIB?=/' Makefile-libbz2_*
	sed -i -e 's/^CFLAGS=/CFLAGS?=/' -e 's/^LDFLAGS=/LDFLAGS?=/' Makefile-libbz2_*
	sed -i 's/\\\$(CC) -shared/\\\$(CC) \\\$(CFLAGS) -shared/g' Makefile-libbz2_so
	sed -i '/all:/ s/ test$//' Makefile-libbz2_a

	cat >bzip2.pc <<-EOF
		prefix=${INSTALL_PREFIX}
		exec_prefix=${INSTALL_EXECPREFIX}
		bindir=${INSTALL_PREFIX}/bin
		libdir=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
		includedir=${INSTALL_INCLUDEDIR}

		Name: bzip2
		Description: A file compression library
		Version: 1.0.6
		Libs: -L\\\${libdir} -lbz2
		Cflags: -I\\\${includedir}
	EOF

	cat >Makefile <<EOF
LIBRARY_VERSION = 1.0.8
STRIP ?= strip

all:
	\\\$(MAKE) -f Makefile-libbz2_so DESTDIR=\\\$(DESTDIR) PREFIX=\\\$(PREFIX) all
	\\\$(MAKE) -f Makefile-libbz2_a clean *.o
	\\\$(MAKE) -f Makefile-libbz2_a DESTDIR=\\\$(DESTDIR) PREFIX=\\\$(PREFIX) all

install-common:
	mkdir -p \\\$(DESTDIR)\\\$(PREFIX)/bin
	mkdir -p \\\$(DESTDIR)\\\$(PREFIX)/share/man/man1
	mkdir -p \\\$(DESTDIR)\\\$(PREFIX)/lib${HARCH_LIB}\\\$(LIBSUFFIX)/pkgconfig
	mkdir -p \\\$(DESTDIR)\\\$(PREFIX)/include
	chmod 644 bzlib.h
	cp -p bzlib.h \\\$(DESTDIR)\\\$(PREFIX)/include
	install -m 755 bzip2recover bzgrep bzdiff bzmore  \\\$(DESTDIR)\\\$(PREFIX)/bin/
	install -m 644 libbz2.a \\\$(DESTDIR)\\\$(PREFIX)/lib${HARCH_LIB}\\\$(LIBSUFFIX)
	ln -fs bzip2 \\\$(DESTDIR)\\\$(PREFIX)/bin/bunzip2
	ln -fs bzip2 \\\$(DESTDIR)\\\$(PREFIX)/bin/bzcat
	ln -fs bzdiff \\\$(DESTDIR)\\\$(PREFIX)/bin/bzcmp
	ln -fs bzmore \\\$(DESTDIR)\\\$(PREFIX)/bin/bzless
	ln -fs bzgrep \\\$(DESTDIR)\\\$(PREFIX)/bin/bzegrep
	ln -fs bzgrep \\\$(DESTDIR)\\\$(PREFIX)/bin/bzfgrep
	ln -fs libbz2.so.\\\$(LIBRARY_VERSION) \\\$(DESTDIR)\\\$(PREFIX)/lib${HARCH_LIB}\\\$(LIBSUFFIX)/libbz2.so.1
	ln -fs libbz2.so.1 \\\$(DESTDIR)\\\$(PREFIX)/lib${HARCH_LIB}\\\$(LIBSUFFIX)/libbz2.so
	install -m 644 bzip2.pc \\\$(DESTDIR)\\\$(PREFIX)/lib${HARCH_LIB}\\\$(LIBSUFFIX)/pkgconfig/bzip2.pc
	cp -p bzip2.1 bzdiff.1 bzgrep.1 bzmore.1  \\\$(DESTDIR)\\\$(PREFIX)/share/man/man1/
	ln -fs bzip2.1 \\\$(DESTDIR)\\\$(PREFIX)/share/man/man1/bzip2recover.1
	ln -fs bzip2.1 \\\$(DESTDIR)\\\$(PREFIX)/share/man/man1/bunzip2.1
	ln -fs bzip2.1 \\\$(DESTDIR)\\\$(PREFIX)/share/man/man1/bzcat.1
	ln -fs bzdiff.1 \\\$(DESTDIR)\\\$(PREFIX)/share/man/man1/bzcmp.1
	ln -fs bzmore.1 \\\$(DESTDIR)\\\$(PREFIX)/share/man/man1/bzless.1
	ln -fs bzgrep.1 \\\$(DESTDIR)\\\$(PREFIX)/share/man/man1/bzegrep.1
	ln -fs bzgrep.1 \\\$(DESTDIR)\\\$(PREFIX)/share/man/man1/bzfgrep.1

install: all install-common
	install -m 755 libbz2.so.\\\$(LIBRARY_VERSION) \\\$(DESTDIR)\\\$(PREFIX)/lib${HARCH_LIB}\\\$(LIBSUFFIX)
	install -m 755 bzip2-shared  \\\$(DESTDIR)\\\$(PREFIX)/bin/bzip2

install-strip: all install-common
	install --strip-program=\\\$(STRIP) -s -m 755 libbz2.so.\\\$(LIBRARY_VERSION) \\\$(DESTDIR)\\\$(PREFIX)/lib${HARCH_LIB}\\\$(LIBSUFFIX)
	install --strip-program=\\\$(STRIP) -s -m 755 bzip2-shared  \\\$(DESTDIR)\\\$(PREFIX)/bin/bzip2

clean:
	\\\$(MAKE) -f Makefile-libbz2_so DESTDIR=\\\$(DESTDIR) PREFIX=\\\$(PREFIX) clean
	\\\$(MAKE) -f Makefile-libbz2_a DESTDIR=\\\$(DESTDIR) PREFIX=\\\$(PREFIX) clean
EOF
"
