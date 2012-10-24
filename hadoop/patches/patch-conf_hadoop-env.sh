$NetBSD$

Set default variables.
--- conf/hadoop-env.sh.orig	2012-10-03 05:17:13.000000000 +0000
+++ conf/hadoop-env.sh
@@ -6,7 +6,7 @@
 # remote nodes.
 
 # The java implementation to use.  Required.
-# export JAVA_HOME=/usr/lib/j2sdk1.5-sun
+export JAVA_HOME=@PKG_JAVA_HOME@
 
 # Extra Java CLASSPATH elements.  Optional.
 # export HADOOP_CLASSPATH=
@@ -15,7 +15,7 @@
 # export HADOOP_HEAPSIZE=2000
 
 # Extra Java runtime options.  Empty by default.
-# export HADOOP_OPTS=-server
+export HADOOP_OPTS="@JAVA_ARCH_FLAG@"
 
 # Command specific options appended to HADOOP_OPTS when specified
 export HADOOP_NAMENODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_NAMENODE_OPTS"
@@ -31,7 +31,7 @@ export HADOOP_JOBTRACKER_OPTS="-Dcom.sun
 # export HADOOP_SSH_OPTS="-o ConnectTimeout=1 -o SendEnv=HADOOP_CONF_DIR"
 
 # Where log files are stored.  $HADOOP_HOME/logs by default.
-# export HADOOP_LOG_DIR=${HADOOP_HOME}/logs
+export HADOOP_LOG_DIR=@HADOOP_LOGDIR@
 
 # File naming remote slave hosts.  $HADOOP_HOME/conf/slaves by default.
 # export HADOOP_SLAVES=${HADOOP_HOME}/conf/slaves
@@ -45,7 +45,7 @@ export HADOOP_JOBTRACKER_OPTS="-Dcom.sun
 # export HADOOP_SLAVE_SLEEP=0.1
 
 # The directory where pid files are stored. /tmp by default.
-# export HADOOP_PID_DIR=/var/hadoop/pids
+export HADOOP_PID_DIR=@HADOOP_DIR@/pids
 
 # A string representing this instance of hadoop. $USER by default.
 # export HADOOP_IDENT_STRING=$USER
