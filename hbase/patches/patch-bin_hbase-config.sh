$NetBSD$

--- bin/hbase-config.sh.orig	2012-11-14 20:50:56.000000000 +0000
+++ bin/hbase-config.sh
@@ -45,7 +45,7 @@ this="$bin/$script"
 
 # the root of the hbase installation
 if [ -z "$HBASE_HOME" ]; then
-  export HBASE_HOME=`dirname "$this"`/..
+  export HBASE_HOME=`dirname "$this"`/../share/hbase
 fi
 
 #check to see if the conf dir or hbase home are given as an optional arguments
@@ -70,7 +70,7 @@ do
 done
  
 # Allow alternate hbase conf dir location.
-HBASE_CONF_DIR="${HBASE_CONF_DIR:-$HBASE_HOME/conf}"
+HBASE_CONF_DIR="${HBASE_CONF_DIR:-@PKG_SYSCONFDIR@}"
 # List of hbase regions servers.
 HBASE_REGIONSERVERS="${HBASE_REGIONSERVERS:-$HBASE_CONF_DIR/regionservers}"
 # List of hbase secondary masters.
@@ -87,6 +87,7 @@ export MALLOC_ARENA_MAX=${MALLOC_ARENA_M
 
 if [ -z "$JAVA_HOME" ]; then
   for candidate in \
+    @PKG_JAVA_HOME@ \
     /usr/lib/jvm/java-6-sun \
     /usr/lib/jvm/java-1.6.0-sun-1.6.0.*/jre \
     /usr/lib/jvm/java-1.6.0-sun-1.6.0.* \
