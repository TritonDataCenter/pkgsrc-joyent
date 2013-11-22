$NetBSD$

--- bin/stop-hbase.sh.orig	Thu Apr 25 01:49:28 2013
+++ bin/stop-hbase.sh	Fri Nov 22 09:18:39 2013
@@ -48,7 +48,7 @@
 echo -n stopping hbase
 echo "`date` Stopping hbase (via master)" >> $loglog
 
-nohup nice -n ${HBASE_NICENESS:-0} "$HBASE_HOME"/bin/hbase \
+nohup nice -n ${HBASE_NICENESS:-0} "$bin"/hbase \
    --config "${HBASE_CONF_DIR}" \
    master stop "$@" > "$logout" 2>&1 < /dev/null &
 
