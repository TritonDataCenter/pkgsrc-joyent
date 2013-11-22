$NetBSD$

--- bin/hbase-daemon.sh.orig	Thu Apr 25 01:49:28 2013
+++ bin/hbase-daemon.sh	Fri Nov 22 09:18:22 2013
@@ -152,7 +152,7 @@
     # Add to the command log file vital stats on our environment.
     echo "`date` Starting $command on `hostname`" >> $loglog
     echo "`ulimit -a`" >> $loglog 2>&1
-    nohup nice -n $HBASE_NICENESS "$HBASE_HOME"/bin/hbase \
+    nohup nice -n $HBASE_NICENESS "$bin"/hbase \
         --config "${HBASE_CONF_DIR}" \
         $command "$@" $startStop > "$logout" 2>&1 < /dev/null &
     echo $! > $pid
