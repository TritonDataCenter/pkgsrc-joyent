$NetBSD$

--- tools/src/main/bin/ooziedb.sh.orig	2013-01-17 23:39:20.000000000 +0000
+++ tools/src/main/bin/ooziedb.sh
@@ -34,9 +34,9 @@ BASEDIR=`dirname ${PRG}`
 BASEDIR=`cd ${BASEDIR}/..;pwd`
 
 OOZIE_HOME=${BASEDIR}
-OOZIE_CONFIG=${OOZIE_HOME}/conf
-OOZIE_LOG=${OOZIE_HOME}/logs
-OOZIE_DATA=${OOZIE_HOME}/data
+OOZIE_CONFIG=@PKG_SYSCONFBASE@
+OOZIE_LOG=@OOZIE_LOG_DIR@
+OOZIE_DATA=@OOZIE_DB_DIR@
 
 if [ -f ${OOZIE_HOME}/bin/oozie-env.sh ]
 then
