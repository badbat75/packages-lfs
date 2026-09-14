# shellcheck shell=bash
# shellcheck disable=SC2154
# libaudit: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

pushd ${PKG_PKGPATH}${INSTALL_PREFIX}
patch -p1 <<-EOF
diff -urp usr.orig/include/libaudit.h.orig usr/include/libaudit.h
--- usr.orig/include/libaudit.h.orig	2022-02-14 14:14:08.000000000 -0500
+++ usr/include/libaudit.h	2022-02-23 13:35:52.638340789 -0500
@@ -39,7 +39,7 @@ extern "C" {
 #include <stdint.h>
 #include <sys/socket.h>
 #include <linux/netlink.h>
-#include "audit.h"
+#include <linux/audit.h>
 #include <stdarg.h>
 #include <syslog.h>

EOF
popd
