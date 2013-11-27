$NetBSD$

Set default paths.
--- bin/elasticsearch.in.sh.orig	2013-11-13 12:07:38.000000000 +0000
+++ bin/elasticsearch.in.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-ES_CLASSPATH=$ES_CLASSPATH:$ES_HOME/lib/elasticsearch-0.90.7.jar:$ES_HOME/lib/*:$ES_HOME/lib/sigar/*
+ES_CLASSPATH=$ES_CLASSPATH:$ES_HOME/lib/elasticsearch/elasticsearch-0.90.7.jar:$ES_HOME/lib/elasticsearch/*:$ES_HOME/lib/elasticsearch/sigar/*
 
 if [ "x$ES_MIN_MEM" = "x" ]; then
     ES_MIN_MEM=256m
@@ -62,3 +62,5 @@ JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOut
 # The path to the heap dump location, note directory must exists and have enough
 # space for a full heap dump.
 #JAVA_OPTS="$JAVA_OPTS -XX:HeapDumpPath=$ES_HOME/logs/heapdump.hprof"
+
+ES_JAVA_OPTS="$ES_JAVA_OPTS -Des.config=@PKG_SYSCONFDIR@/elasticsearch.yml -Des.pidfile=@ES_WRKDIR@/elasticsearch.pid"
