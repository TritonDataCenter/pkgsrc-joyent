$NetBSD$

--- bin/hcat-config.sh.orig	2012-05-07 18:44:37.000000000 +0000
+++ bin/hcat-config.sh
@@ -53,7 +53,7 @@ if [ -e "${HCAT_PREFIX}/etc/hcatalog/hca
 else
   DEFAULT_CONF_DIR="/etc/hcatalog"
 fi
-HCAT_CONF_DIR="${HCAT_CONF_DIR:-$DEFAULT_CONF_DIR}"
+HCAT_CONF_DIR="${HCAT_CONF_DIR:-@PKG_SYSCONFDIR@}"
 
 #users can add various env vars to hcat-env.sh in the conf
 #rather than having to export them before running the command
