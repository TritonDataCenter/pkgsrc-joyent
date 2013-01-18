$NetBSD$

--- bin/hive-config.sh.orig	2012-04-24 18:49:08.000000000 +0000
+++ bin/hive-config.sh
@@ -61,7 +61,7 @@ done
 
 
 # Allow alternate conf dir location.
-HIVE_CONF_DIR="${HIVE_CONF_DIR:-$HIVE_HOME/conf}"
+HIVE_CONF_DIR="${HIVE_CONF_DIR:-@PKG_SYSCONFDIR@}"
 
 export HIVE_CONF_DIR=$HIVE_CONF_DIR
 export HIVE_AUX_JARS_PATH=$HIVE_AUX_JARS_PATH
