$NetBSD$

Set config file dir properly.
--- bin/hadoop-config.sh.orig	2012-05-08 20:34:50.000000000 +0000
+++ bin/hadoop-config.sh
@@ -46,12 +46,7 @@ then
 fi
  
 # Allow alternate conf dir location.
-if [ -e "${HADOOP_PREFIX}/conf/hadoop-env.sh" ]; then
-  DEFAULT_CONF_DIR="conf"
-else
-  DEFAULT_CONF_DIR="etc/hadoop"
-fi
-HADOOP_CONF_DIR="${HADOOP_CONF_DIR:-$HADOOP_PREFIX/$DEFAULT_CONF_DIR}"
+HADOOP_CONF_DIR="${HADOOP_CONF_DIR:-@PKG_SYSCONFDIR@}"
 
 #check to see it is specified whether to use the slaves or the
 # masters file
