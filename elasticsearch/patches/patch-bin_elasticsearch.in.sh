$NetBSD$

Set default paths.
--- bin/elasticsearch.in.sh.orig	2014-02-12 16:20:00.000000000 +0000
+++ bin/elasticsearch.in.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-ES_CLASSPATH=$ES_CLASSPATH:$ES_HOME/lib/elasticsearch-1.0.0.jar:$ES_HOME/lib/*:$ES_HOME/lib/sigar/*
+ES_CLASSPATH=$ES_CLASSPATH:$ES_HOME/lib/elasticsearch/elasticsearch-0.90.7.jar:$ES_HOME/lib/elasticsearch/*:$ES_HOME/lib/elasticsearch/sigar/*
 
 if [ "x$ES_MIN_MEM" = "x" ]; then
     ES_MIN_MEM=256m
@@ -61,4 +61,7 @@ fi
 JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError"
 # The path to the heap dump location, note directory must exists and have enough
 # space for a full heap dump.
-#JAVA_OPTS="$JAVA_OPTS -XX:HeapDumpPath=$ES_HOME/logs/heapdump.hprof"
\ No newline at end of file
+#JAVA_OPTS="$JAVA_OPTS -XX:HeapDumpPath=$ES_HOME/logs/heapdump.hprof"
+
+# The path to the config and pid files
+ES_JAVA_OPTS="$ES_JAVA_OPTS -Des.config=@PKG_SYSCONFDIR@/elasticsearch.yml -Des.pidfile=@ES_WRKDIR@/elasticsearch.pid"
