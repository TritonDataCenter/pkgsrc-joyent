$NetBSD$

Set vars needed for selecting the architecture.
--- conf/hadoop-env.sh.orig	2012-05-08 20:34:50.000000000 +0000
+++ conf/hadoop-env.sh
@@ -15,7 +15,7 @@
 # export HADOOP_HEAPSIZE=2000
 
 # Extra Java runtime options.  Empty by default.
-# export HADOOP_OPTS=-server
+export HADOOP_OPTS="@JAVA_ARCH_FLAG@"
 
 # Command specific options appended to HADOOP_OPTS when specified
 export HADOOP_NAMENODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_NAMENODE_OPTS"
@@ -26,6 +26,7 @@ export HADOOP_JOBTRACKER_OPTS="-Dcom.sun
 # export HADOOP_TASKTRACKER_OPTS=
 # The following applies to multiple commands (fs, dfs, fsck, distcp etc)
 # export HADOOP_CLIENT_OPTS
+HADOOP_JAVA_PLATFORM_OPTS="@JAVA_ARCH_FLAG@ $HADOOP_JAVA_PLATFORM_OPTS"
 
 # Extra ssh options.  Empty by default.
 # export HADOOP_SSH_OPTS="-o ConnectTimeout=1 -o SendEnv=HADOOP_CONF_DIR"
