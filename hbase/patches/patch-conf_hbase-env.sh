$NetBSD$

--- conf/hbase-env.sh.orig	2012-11-14 20:50:55.000000000 +0000
+++ conf/hbase-env.sh
@@ -68,7 +68,7 @@ export HBASE_OPTS="$HBASE_OPTS -XX:+UseC
 # export HBASE_SSH_OPTS="-o ConnectTimeout=1 -o SendEnv=HBASE_CONF_DIR"
 
 # Where log files are stored.  $HBASE_HOME/logs by default.
-# export HBASE_LOG_DIR=${HBASE_HOME}/logs
+export HBASE_LOG_DIR=@HBASE_LOG_DIR@
 
 # Enable remote JDWP debugging of major HBase processes. Meant for Core Developers 
 # export HBASE_MASTER_OPTS="$HBASE_MASTER_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8070"
@@ -83,7 +83,7 @@ export HBASE_OPTS="$HBASE_OPTS -XX:+UseC
 # export HBASE_NICENESS=10
 
 # The directory where pid files are stored. /tmp by default.
-# export HBASE_PID_DIR=/var/hadoop/pids
+export HBASE_PID_DIR=@HBASE_PID_DIR@
 
 # Seconds to sleep between slave commands.  Unset by default.  This
 # can be useful in large clusters, where, e.g., slave rsyncs can
