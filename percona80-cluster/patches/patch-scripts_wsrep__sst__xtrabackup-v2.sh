$NetBSD$

Fix paths and port to SunOS.

--- scripts/wsrep_sst_xtrabackup-v2.sh.orig	2024-11-04 14:08:42.000000000 +0000
+++ scripts/wsrep_sst_xtrabackup-v2.sh
@@ -136,12 +136,12 @@ DATA="${WSREP_SST_OPT_DATA}"
 
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
@@ -161,7 +161,7 @@ JOINER_SST_DIR=""
 
 # Setting the path for ss and ip
 # ss: is utility to investigate socket, ip for network routes.
-export PATH="/usr/sbin:/sbin:$PATH"
+export PATH="@LOCALBASE@/sbin:@LOCALBASE@/bin:/usr/sbin:/usr/bin:/sbin"
 
 #-------------------------------------------------------------------------------
 #
@@ -919,7 +919,14 @@ get_stream()
 get_proc()
 {
     set +e
-    nproc=$(grep -c processor /proc/cpuinfo)
+    if [ $(uname -s) = "SunOS" ]; then
+        nproc=$(kstat -p caps::cpucaps_zone*:value | awk '{ printf "%d", ($2+100-1)/100 }')
+        if [ -z "$nproc" ]; then
+            nproc=$(psrinfo | wc -l)
+        fi
+    else
+        nproc=$(grep -c processor /proc/cpuinfo)
+    fi
     [[ -z $nproc || $nproc -eq 0 ]] && nproc=1
     set -e
 }
@@ -964,7 +971,7 @@ cleanup_joiner()
     fi
 
     # Final cleanup
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -1003,7 +1010,7 @@ cleanup_donor()
     fi
 
     # Final cleanup
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -1168,7 +1175,7 @@ wait_for_listen()
         wsrep_log_debug "$LINENO: Using ss for socat/nc discovery"
 
         # Revert to using ss to check if socat/nc is listening
-        wsrep_check_program ss
+        : wsrep_check_program ss
         if [[ $? -ne 0 ]]; then
             wsrep_log_error "******** FATAL ERROR *********************** "
             wsrep_log_error "* Could not find 'ss'.  Check that it is installed and in the path."
@@ -1178,7 +1185,7 @@ wait_for_listen()
 
         for i in {1..300}
         do
-            ss -p state listening "( sport = :${port} )" | grep -qE 'socat|nc' && break
+            netstat -an | awk 'BEGIN {rc=1} /\.'${port}' .* LISTEN/ {rc=0} END {exit(rc)}' && break
             sleep 0.2
         done
 
@@ -1652,7 +1659,9 @@ function initialize_pxb_commands()
     xb_version=${xb_version# }
     wsrep_log_debug "pxb-version:$xb_version"
 
-    local decompress_threads=$(grep -c ^processor /proc/cpuinfo)
+    get_proc
+
+    local decompress_threads=${nproc}
     if [[ $decompress_threads -gt 1 ]]; then
         decompress_threads=$((decompress_threads/2))
     fi
