$NetBSD$

--- distro/src/main/bin/oozie-sys.sh.orig	2013-01-17 23:39:20.000000000 +0000
+++ distro/src/main/bin/oozie-sys.sh
@@ -90,7 +90,7 @@ if [ "${OOZIE_HOME}" != "${oozie_home}"
 fi
 
 if [ "${OOZIE_CONFIG}" = "" ]; then
-  export OOZIE_CONFIG=${OOZIE_HOME}/conf
+  export OOZIE_CONFIG=@PKG_SYSCONFDIR@
   print "Setting OOZIE_CONFIG:        ${OOZIE_CONFIG}"
 else
   print "Using   OOZIE_CONFIG:        ${OOZIE_CONFIG}"
@@ -129,14 +129,14 @@ else
 fi
 
 if [ "${OOZIE_DATA}" = "" ]; then
-  export OOZIE_DATA=${OOZIE_HOME}/data
+  export OOZIE_DATA=@OOZIE_DATA_DIR@
   print "Setting OOZIE_DATA:          ${OOZIE_DATA}"
 else
   print "Using   OOZIE_DATA:          ${OOZIE_DATA}"
 fi
 
 if [ "${OOZIE_LOG}" = "" ]; then
-  export OOZIE_LOG=${OOZIE_HOME}/logs
+  export OOZIE_LOG=@OOZIE_LOG_DIR@
   print "Setting OOZIE_LOG:           ${OOZIE_LOG}"
 else
   print "Using   OOZIE_LOG:           ${OOZIE_LOG}"
@@ -161,7 +161,7 @@ else
 fi
 
 if [ "${OOZIE_HTTP_HOSTNAME}" = "" ]; then
-  export OOZIE_HTTP_HOSTNAME=`hostname -f`
+  export OOZIE_HTTP_HOSTNAME=`hostname`.`domainname`
   print "Setting OOZIE_HTTP_HOSTNAME: ${OOZIE_HTTP_HOSTNAME}"
 else
   print "Using   OOZIE_HTTP_HOSTNAME: ${OOZIE_HTTP_HOSTNAME}"
@@ -203,7 +203,7 @@ else
 fi
 
 if [ "${CATALINA_PID}" = "" ]; then
-  export CATALINA_PID=${OOZIE_HOME}/oozie-server/temp/oozie.pid
+  export CATALINA_PID=@OOZIE_PID_DIR@/oozie.pid
   print "Setting CATALINA_PID:        ${CATALINA_PID}"
 else
   print "Using   CATALINA_PID:        ${CATALINA_PID}"
