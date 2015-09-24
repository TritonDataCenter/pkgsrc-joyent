$NetBSD$

Paths.

--- bin/kafka-run-class.sh.orig	2015-02-26 22:12:05.000000000 +0000
+++ bin/kafka-run-class.sh
@@ -22,9 +22,13 @@ fi
 
 base_dir=$(dirname $0)/..
 
+if [ "x$JAVA_HOME" = "x" ]; then
+    JAVA_HOME=@PKG_JAVA_HOME@
+fi
+
 # create logs directory
 if [ "x$LOG_DIR" = "x" ]; then
-    LOG_DIR="$base_dir/logs"
+    LOG_DIR="@KAFKA_LOGDIR@"
 fi
 
 if [ ! -d "$LOG_DIR" ]; then
@@ -39,39 +43,8 @@ if [ -z "$SCALA_BINARY_VERSION" ]; then
 	SCALA_BINARY_VERSION=2.10
 fi
 
-# run ./gradlew copyDependantLibs to get all dependant jars in a local dir
-for file in $base_dir/core/build/dependant-libs-${SCALA_VERSION}*/*.jar;
-do
-  CLASSPATH=$CLASSPATH:$file
-done
-
-for file in $base_dir/examples/build/libs//kafka-examples*.jar;
-do
-  CLASSPATH=$CLASSPATH:$file
-done
-
-for file in $base_dir/contrib/hadoop-consumer/build/libs//kafka-hadoop-consumer*.jar;
-do
-  CLASSPATH=$CLASSPATH:$file
-done
-
-for file in $base_dir/contrib/hadoop-producer/build/libs//kafka-hadoop-producer*.jar;
-do
-  CLASSPATH=$CLASSPATH:$file
-done
-
-for file in $base_dir/clients/build/libs/kafka-clients*.jar;
-do
-  CLASSPATH=$CLASSPATH:$file
-done
-
 # classpath addition for release
-for file in $base_dir/libs/*.jar;
-do
-  CLASSPATH=$CLASSPATH:$file
-done
-
-for file in $base_dir/core/build/libs/kafka_${SCALA_BINARY_VERSION}*.jar;
+for file in $base_dir/share/kafka/libs/*.jar;
 do
   CLASSPATH=$CLASSPATH:$file
 done
@@ -88,7 +61,7 @@ fi
 
 # Log4j settings
 if [ -z "$KAFKA_LOG4J_OPTS" ]; then
-  KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:$base_dir/config/tools-log4j.properties"
+  KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:@PKG_SYSCONFDIR@/tools-log4j.properties"
 fi
 
 KAFKA_LOG4J_OPTS="-Dkafka.logs.dir=$LOG_DIR $KAFKA_LOG4J_OPTS"
