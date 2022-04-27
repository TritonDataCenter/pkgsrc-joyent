$NetBSD$

Make SunOS portable.  XXX: needs to be better really.

--- scripts/wsrep_sst_xtrabackup-v2.sh.orig	2022-02-07 19:58:25.000000000 +0000
+++ scripts/wsrep_sst_xtrabackup-v2.sh
@@ -1022,6 +1022,8 @@ get_proc()
     nproc=1
     [ "$OS" = "Linux" ] && nproc=$(grep -c processor /proc/cpuinfo)
     [ "$OS" = "Darwin" -o "$OS" = "FreeBSD" ] && nproc=$(sysctl -n hw.ncpu)
+    [ "$OS" = "SunOS" ] && nproc=$(kstat -p caps::cpucaps_zone*:value | awk '{ printf "%d", ($2+100-1)/100 }')
+
     [[ -z $nproc || $nproc -eq 0 ]] && nproc=1
     set -e
 }
@@ -1058,7 +1060,7 @@ cleanup_joiner()
 
 
     # Final cleanup 
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -1097,7 +1099,7 @@ cleanup_donor()
     fi
 
     # Final cleanup
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -1194,7 +1196,7 @@ wait_for_listen()
         wsrep_log_debug "$LINENO: Using ss for socat/nc discovery"
 
         # Revert to using ss to check if socat/nc is listening
-        wsrep_check_program ss
+        : wsrep_check_program ss
         if [[ $? -ne 0 ]]; then
             wsrep_log_error "******** FATAL ERROR *********************** "
             wsrep_log_error "* Could not find 'ss'.  Check that it is installed and in the path."
@@ -1204,7 +1206,7 @@ wait_for_listen()
 
         for i in {1..300}
         do
-            ss -p state listening "( sport = :${port} )" | grep -qE 'socat|nc' && break
+            netstat -an | awk 'BEGIN {rc=1} /\.'${port}' .* LISTEN/ {rc=0} END {exit(rc)}' && break
             sleep 0.2
         done
 
