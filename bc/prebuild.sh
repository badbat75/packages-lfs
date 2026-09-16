# shellcheck shell=bash
# shellcheck disable=SC2154
# bc: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# The cross build patch is in patches/, applied before this; here the *_FOR_BUILD flags are
# wired into the host-side objects of the Makefile.am files.

sed -i "/^%.o_host : CFLAGS:=/a %.o_host : CPPFLAGS:=" lib/Makefile.am
sed -i "/^%.o_host : CFLAGS:=/a %.o_host : CPPFLAGS:=" bc/Makefile.am
sed -i "s/CFLAGS:=$/CFLAGS:=\$(CFLAGS_FOR_BUILD)/g" bc/Makefile.am
sed -i "s/CPPFLAGS:=$/CPPFLAGS:=\$(CPPFLAGS_FOR_BUILD)/g" bc/Makefile.am
sed -i "s/LDFLAGS:=$/LDFLAGS:=\$(LDFLAGS_FOR_BUILD)/g" bc/Makefile.am
