$NetBSD$

Fix paths and port to SunOS.

--- scripts/wsrep_sst_xtrabackup-v2.sh.orig	2020-12-23 14:48:06.000000000 +0000
+++ scripts/wsrep_sst_xtrabackup-v2.sh
@@ -130,12 +130,12 @@ DATA="${WSREP_SST_OPT_DATA}"
 
 # default XB path (for 8.0+)  (relative to script location)
 # Use this path for 8.0+
-XTRABACKUP_80_PATH="$(dirname $0)/pxc_extra/pxb-8.0"
+XTRABACKUP_80_PATH="@LOCALBASE@"
 
 # XB path for previous major/minor versison (5.7)  (relative to script location)
 # Use this for previous versions (5.7)
 # Upgrading from anything less than 5.7 is not supported
-XTRABACKUP_24_PATH="$(dirname $0)/pxc_extra/pxb-2.4"
+XTRABACKUP_24_PATH="@LOCALBASE@"
 
 # These files carry some important information in form of GTID of the data
 # that is being backed up.
@@ -153,7 +153,7 @@ PIPESTATUS_FILE="pipestatus"
 
 # Setting the path for ss and ip
 # ss: is utility to investigate socket, ip for network routes.
-export PATH="/usr/sbin:/sbin:$PATH"
+export PATH="@LOCALBASE@/sbin:@LOCALBASE@/bin:/usr/sbin:/usr/bin:/sbin"
 
 #-------------------------------------------------------------------------------
 #
@@ -802,7 +802,11 @@ get_stream()
 get_proc()
 {
     set +e
-    nproc=$(grep -c processor /proc/cpuinfo)
+    if [[ $(uname -s | grep SunOS) ]]; then
+        nproc=$(kstat -p caps::cpucaps_zone*:value | awk '{ printf "%d", ($2+100-1)/100 }')
+    else
+        nproc=$(grep -c processor /proc/cpuinfo)
+    fi
     [[ -z $nproc || $nproc -eq 0 ]] && nproc=1
     set -e
 }
@@ -844,7 +848,7 @@ cleanup_joiner()
     fi
 
     # Final cleanup
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -883,7 +887,7 @@ cleanup_donor()
     fi
 
     # Final cleanup
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -979,7 +983,7 @@ wait_for_listen()
         wsrep_log_debug "$LINENO: Using ss for socat/nc discovery"
 
         # Revert to using ss to check if socat/nc is listening
-        wsrep_check_program ss
+        : wsrep_check_program ss
         if [[ $? -ne 0 ]]; then
             wsrep_log_error "******** FATAL ERROR *********************** "
             wsrep_log_error "* Could not find 'ss'.  Check that it is installed and in the path."
@@ -989,7 +993,7 @@ wait_for_listen()
 
         for i in {1..300}
         do
-            ss -p state listening "( sport = :${port} )" | grep -qE 'socat|nc' && break
+            netstat -an | awk 'BEGIN {rc=1} /\.'${port}' .* LISTEN/ {rc=0} END {exit(rc)}' && break
             sleep 0.2
         done
 
