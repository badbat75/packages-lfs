# bc
PKG_VER=1.07
PKG_URL="https://ftp.gnu.org/gnu/bc/bc-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/bison:native lfs/flex:native lfs/readline:cross lfs/ncurses lfs/readline"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--with-readline"
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD='cat <<EOF | patch -s -p1 || true
diff -Naur bc-1.07.orig/bc/Makefile.am bc-1.07/bc/Makefile.am
--- bc-1.07.orig/bc/Makefile.am$(echo -e "\\t")2016-02-29 23:50:35.000000000 +0100
+++ bc-1.07/bc/Makefile.am$(echo -e "\\t")2021-02-11 15:44:44.890000000 +0100
@@ -17,6 +17,7 @@
 
 AM_CPPFLAGS = -I\$(srcdir) -I\$(srcdir)/../h
 LIBBC = ../lib/libbc.a
+LIBBC_HOST = ../lib/libbc_host.a
 LIBL = @LEXLIB@
 LDADD = \$(LIBBC) \$(LIBL) @READLINELIB@
 
@@ -29,6 +30,9 @@
 scan.o: bc.h
 global.o: libmath.h
 
+main_host.c : main.c
+$(echo -e "\\t")cp \$< \$@
+
 libmath.h: libmath.b
 $(echo -e "\\t")echo "{0}" > libmath.h
 $(echo -e "\\t")\$(MAKE) fbc
@@ -36,10 +40,21 @@
 $(echo -e "\\t")\$(srcdir)/fix-libmath_h
 $(echo -e "\\t")rm -f ./fbc ./global.o
 
-fbcOBJ = main.o bc.o scan.o execute.o global.o load.o storage.o util.o \\
-         warranty.o
-fbc: \$(fbcOBJ) \$(LIBBC)
-$(echo -e "\\t")\$(LINK) \$(fbcOBJ) \$(LIBBC) \$(LIBL) \$(READLINELIB) \$(LIBS)
+fbcOBJ = \$(addsuffix _host,main.o bc.o scan.o execute.o global.o load.o storage.o util.o \\
+         warranty.o)
+
+%.o_host : CC:=\$(CC_FOR_BUILD)
+%.o_host : AM_CFLAGS:=
+%.o_host : CFLAGS:=
+%.o_host : %.c
+$(echo -e "\\t")\$(COMPILE) -c \$(CFLAGS) \$(INCLUDES) -o \$@ \$<
+
+fbc: CCLD:=\$(CC_FOR_BUILD)
+fbc: CFLAGS:=
+fbc: AM_CFLAGS:=
+fbc: LDFLAGS:=
+fbc: \$(fbcOBJ) \$(LIBBC_HOST)
+$(echo -e "\\t")\$(LINK) \$(fbcOBJ) \$(LIBBC_HOST) \$(LIBL) \$(READLINELIB) \$(LIBS)
 
 sbcOBJ = main.o sbc.o scan.o execute.o global.o load.o storage.o util.o \\
          warranty.o
diff -Naur bc-1.07.orig/configure.ac bc-1.07/configure.ac
--- bc-1.07.orig/configure.ac$(echo -e "\\t")2017-01-23 16:42:39.000000000 +0100
+++ bc-1.07/configure.ac$(echo -e "\\t")2021-02-11 15:45:28.560000000 +0100
@@ -20,6 +20,7 @@
 
 AC_INIT([bc],[bc_version])
 AC_CONFIG_SRCDIR(doc/bc.1)
+AC_CONFIG_MACRO_DIR([m4])
 AM_INIT_AUTOMAKE([dist-bzip2])
 AC_CONFIG_HEADERS(config.h)
 
@@ -35,6 +36,7 @@
 $(echo -e "\\t")  [Define the dc copyright line.])
 
 AC_PROG_CC
+AX_CC_FOR_BUILD
 AC_USE_SYSTEM_EXTENSIONS
 
 AM_PROG_LEX
diff -Naur bc-1.07.orig/configure.ac.orig bc-1.07/configure.ac.orig
--- bc-1.07.orig/configure.ac.orig$(echo -e "\\t")1970-01-01 01:00:00.000000000 +0100
+++ bc-1.07/configure.ac.orig$(echo -e "\\t")2021-02-11 15:02:53.750000000 +0100
@@ -0,0 +1,130 @@
+dnl Process this file with autoconf to produce a configure script.
+
+dnl Copyright (C) 2006, 2016 Free Software Foundation, Inc.
+dnl
+dnl This program is free software; you can redistribute it and/or modify
+dnl it under the terms of the GNU General Public License as published by
+dnl the Free Software Foundation; either version 3, or (at your option)
+dnl any later version.
+dnl
+dnl This program is distributed in the hope that it will be useful,
+dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
+dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+dnl GNU General Public License for more details.
+dnl
+dnl You should have received a copy of the GNU General Public License
+> dnl along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+m4_define([bc_version], 1.07)
+m4_define([dc_version], 1.4)
+
+AC_INIT([bc],[bc_version])
+AC_CONFIG_SRCDIR(doc/bc.1)
+AC_CONFIG_MACRO_DIR([m4])
+AM_INIT_AUTOMAKE([dist-bzip2])
+AC_CONFIG_HEADERS(config.h)
+
+AC_DEFINE([DC_VERSION], "dc_version",
+$(echo -e "\\t")  [Define the dc version number.])
+
+AC_DEFINE([BC_COPYRIGHT],
+$(echo -e "\\t")  ["Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017 Free Software Foundation, Inc."],
+$(echo -e "\\t")  [Define the bc copyright line.])
+
+AC_DEFINE([DC_COPYRIGHT], 
+          ["Copyright 1994, 1997, 1998, 2000, 2001, 2004, 2005, 2006, 2016 Free Software Foundation, Inc."],
+$(echo -e "\\t")  [Define the dc copyright line.])
+
+AC_PROG_CC
+AX_CC_FOR_BUILD
+AC_USE_SYSTEM_EXTENSIONS
+
+AM_PROG_LEX
+AM_PROG_AR
+AC_PROG_YACC
+AC_PROG_INSTALL
+AC_PROG_RANLIB
+AC_PROG_MAKE_SET
+
+AC_CHECK_HEADERS_ONCE(stdarg.h stddef.h stdlib.h string.h errno.h limits.h unistd.h lib.h)
+AC_C_CONST
+AC_TYPE_SIZE_T
+AC_CHECK_TYPE(ptrdiff_t, size_t)
+
+AC_FUNC_VPRINTF
+AC_CHECK_FUNCS(isgraph setvbuf fstat strtol)
+
+AC_ARG_WITH(pkg,
+   AS_HELP_STRING([--with-pkg],[use software installed in /usr/pkg tree]),
+   [case \$withval in no) ;;
+      *) CPPFLAGS="\$CPPFLAGS -I/usr/pkg/include"
+$(echo -e "\\t") LDFLAGS="\$LDFLAGS -L/usr/pkg/lib"
+$(echo -e "\\t") echo Using /usr/pkg/include and /usr/pkg/lib ;;
+    esac])
+
+bcle=n
+AC_ARG_WITH(libedit,
+   AS_HELP_STRING([--with-libedit],[support fancy BSD command input editing]),
+   [case \$withval in no) ;;
+      *) LDSAVE=\$LDFLAGS
+$(echo -e "\\t") AC_CHECK_LIB(termcap,tgetent,TERMLIB=-ltermcap)
+$(echo -e "\\t") LDFLAGS="\$LDFLAGS \$TERMLIB"
+$(echo -e "\\t") AC_CHECK_LIB(edit,el_gets,
+$(echo -e "\\t")    [AC_CHECK_HEADER(histedit.h,
+$(echo -e "\\t")     READLINELIB="-ledit \$TERMLIB";bcle=y)],
+$(echo -e "\\t")    READLINELIB="")
+$(echo -e "\\t") case \$bcle in
+$(echo -e "\\t")   y) AC_DEFINE(LIBEDIT,1, [Define if libedit is used])
+$(echo -e "\\t")      echo Using the libedit library. ;;
+$(echo -e "\\t") esac
+$(echo -e "\\t") LDFLAGS=\$LDSAVE
+$(echo -e "\\t") ;;
+    esac])
+ 
+bcrl=n
+AC_ARG_WITH(readline,
+   AS_HELP_STRING([--with-readline],[support fancy command input editing]),
+   [case \$withval in no) ;;
+      *) LDSAVE=\$LDFLAGS
+$(echo -e "\\t") AC_CHECK_LIB(ncurses,tparm,TERMLIB=-lncurses,
+$(echo -e "\\t")    AC_CHECK_LIB(termcap,tgetent,TERMLIB=-ltermcap))
+$(echo -e "\\t") LDFLAGS="\$LDFLAGS \$TERMLIB"
+$(echo -e "\\t") AC_CHECK_LIB(readline,readline,
+$(echo -e "\\t")    [AC_CHECK_HEADER(readline/readline.h,
+$(echo -e "\\t")     READLINELIB="-lreadline \$TERMLIB";bcrl=y)],
+$(echo -e "\\t")    READLINELIB="")
+$(echo -e "\\t") case \$bcrl in
+$(echo -e "\\t")   y) AC_DEFINE(READLINE,1, [Define if readline is used])
+$(echo -e "\\t")      echo Using the readline library. ;;
+$(echo -e "\\t") esac
+$(echo -e "\\t") LDFLAGS=\$LDSAVE
+$(echo -e "\\t") ;;
+    esac])
+
+case \$bcle-\$bcrl-\$LEX in
+   y-y-*)
+$(echo -e "\\t")AC_MSG_ERROR(Can not use both readline and libedit.  Aborting.) ;;
+   ?-?-flex)
+$(echo -e "\\t")LEX="flex -I -8" ;;
+   ?-y-*)
+$(echo -e "\\t")AC_MSG_ERROR(readline works only with flex.) ;;
+esac
+
+case \$LEX-`uname -s` in
+  lex-SunOS) LEXLIB=""; echo "SunOS using lex does not have a -ll." ;;
+esac
+
+case \$GCC in
+  yes) CFLAGS="\$CFLAGS -Wall -funsigned-char"
+       echo "Adding GCC specific compile flags." ;;
+esac
+
+AC_SUBST(READLINELIB)
+AC_SUBST(BC_VERSION, bc_version)
+AC_SUBST(DC_VERSION, dc_version)
+AC_CONFIG_FILES(
+    Makefile bc/Makefile dc/Makefile
+    lib/Makefile
+    doc/Makefile doc/texi-ver.incl
+  )
+AC_OUTPUT
diff -Naur bc-1.07.orig/lib/Makefile.am bc-1.07/lib/Makefile.am
--- bc-1.07.orig/lib/Makefile.am$(echo -e "\\t")2016-02-01 01:03:25.000000000 +0100
+++ bc-1.07/lib/Makefile.am$(echo -e "\\t")2021-02-11 15:44:52.350000000 +0100
@@ -1,5 +1,5 @@
 ## Process this file with automake to produce Makefile.in
-noinst_LIBRARIES = libbc.a
+noinst_LIBRARIES = libbc.a libbc_host.a
 
 AM_CPPFLAGS = -I. -I.. -I\$(srcdir)/../h
 
@@ -24,3 +24,13 @@
 
 specialnumber: newnumber.o
 $(echo -e "\\t")cp newnumber.o number.o
+
+%.o_host : CC:=\$(CC_FOR_BUILD)
+%.o_host : CFLAGS:=
+%.o_host : AM_CFLAGS:=
+%.o_host : %.c
+$(echo -e "\\t")\$(COMPILE) -c \$(CFLAGS) \$(INCLUDES) -o \$@ \$<
+
+libbc_host.a : \$(addsuffix _host,\$(libbc_a_OBJECTS))
+$(echo -e "\\t")ar cru \$@ \$+
+$(echo -e "\\t")ranlib \$@
diff -Naur bc-1.07.orig/m4/cc_for_build.m4 bc-1.07/m4/cc_for_build.m4
--- bc-1.07.orig/m4/cc_for_build.m4$(echo -e "\\t")1970-01-01 01:00:00.000000000 +0100
+++ bc-1.07/m4/cc_for_build.m4$(echo -e "\\t")2021-02-11 15:02:53.750000000 +0100
@@ -0,0 +1,77 @@
+# ===========================================================================
+#     https://www.gnu.org/software/autoconf-archive/ax_cc_for_build.html
+# ===========================================================================
+#
+# SYNOPSIS
+#
+#   AX_CC_FOR_BUILD
+#
+# DESCRIPTION
+#
+#   Find a build-time compiler. Sets CC_FOR_BUILD and EXEEXT_FOR_BUILD.
+#
+# LICENSE
+#
+#   Copyright (c) 2010 Reuben Thomas <rrt@sc3d.org>
+#   Copyright (c) 1999 Richard Henderson <rth@redhat.com>
+#
+#   This program is free software: you can redistribute it and/or modify it
+#   under the terms of the GNU General Public License as published by the
+#   Free Software Foundation, either version 3 of the License, or (at your
+#   option) any later version.
+#
+#   This program is distributed in the hope that it will be useful, but
+#   WITHOUT ANY WARRANTY; without even the implied warranty of
+#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
+#   Public License for more details.
+#
+#   You should have received a copy of the GNU General Public License along
+#   with this program. If not, see <https://www.gnu.org/licenses/>.
+#
+#   As a special exception, the respective Autoconf Macro'\''s copyright owner
+#   gives unlimited permission to copy, distribute and modify the configure
+#   scripts that are the output of Autoconf when processing the Macro. You
+#   need not follow the terms of the GNU General Public License when using
+#   or distributing such scripts, even though portions of the text of the
+#   Macro appear in them. The GNU General Public License (GPL) does govern
+#   all other use of the material that constitutes the Autoconf Macro.
+#
+#   This special exception to the GPL applies to versions of the Autoconf
+#   Macro released by the Autoconf Archive. When you make and distribute a
+#   modified version of the Autoconf Macro, you may extend this special
+#   exception to the GPL to apply to your modified version as well.
+
+#serial 3
+
+dnl Get a default for CC_FOR_BUILD to put into Makefile.
+AC_DEFUN([AX_CC_FOR_BUILD],
+[# Put a plausible default for CC_FOR_BUILD in Makefile.
+if test -z "\$CC_FOR_BUILD"; then
+  if test "x\$cross_compiling" = "xno"; then
+    CC_FOR_BUILD=\$(CC)
+  else
+    CC_FOR_BUILD=gcc
+  fi
+fi
+AC_SUBST(CC_FOR_BUILD)
+# Also set EXEEXT_FOR_BUILD.
+if test "x\$cross_compiling" = "xno"; then
+  EXEEXT_FOR_BUILD=\$(EXEEXT)
+else
+  AC_CACHE_CHECK([for build system executable suffix], bfd_cv_build_exeext,
+    [rm -f conftest*
+     echo "int main () { return 0; }" > conftest.c
+     bfd_cv_build_exeext=
+     \${CC_FOR_BUILD} -o conftest conftest.c 1>&5 2>&5
+     for file in conftest.*; do
+       case \$file in
+       *.c | *.o | *.obj | *.ilk | *.pdb) ;;
+       *) bfd_cv_build_exeext=`echo \$file | sed -e s/conftest//` ;;
+       esac
+     done
+     rm -f conftest*
+     test x"\${bfd_cv_build_exeext}" = x && bfd_cv_build_exeext=no])
+  EXEEXT_FOR_BUILD=""
+  test x"\${bfd_cv_build_exeext}" != xno && EXEEXT_FOR_BUILD=\${bfd_cv_build_exeext}
+fi
+AC_SUBST(EXEEXT_FOR_BUILD)])dnl
EOF
sed -i "/^%.o_host : CFLAGS:=/a %.o_host : CPPFLAGS:=" lib/Makefile.am
sed -i "/^%.o_host : CFLAGS:=/a %.o_host : CPPFLAGS:=" bc/Makefile.am
sed -i "s/CFLAGS:=$/CFLAGS:=\$(CFLAGS_FOR_BUILD)/g" bc/Makefile.am
sed -i "s/CPPFLAGS:=$/CPPFLAGS:=\$(CPPFLAGS_FOR_BUILD)/g" bc/Makefile.am
sed -i "s/LDFLAGS:=$/LDFLAGS:=\$(LDFLAGS_FOR_BUILD)/g" bc/Makefile.am
'