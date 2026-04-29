$NetBSD$

Fix paths and port to SunOS.

--- scripts/wsrep_sst_xtrabackup-v2.sh.orig	2026-04-06 19:46:14.000000000 +0000
+++ scripts/wsrep_sst_xtrabackup-v2.sh
@@ -179,15 +179,15 @@ DATA="${WSREP_SST_OPT_DATA}"
 XTRABACKUP_PATH_PREFIX="$(dirname $0)/pxc_extra/pxb-"
 
 # XB path compatible with the current version of PXC
-XTRABACKUP_THIS_VER_PATH="$(dirname $0)/pxc_extra/pxb-8.4"
+XTRABACKUP_THIS_VER_PATH="@LOCALBASE@"
 
 # XB path compatible with prev PXC version. It may be prev Innovative release or LTS
 # if current PXC version is 1st Innovative.
 # Note that this can be the same as XTRABACKUP_PREV_LTS_VER_PATH
-XTRABACKUP_PREV_VER_PATH="$(dirname $0)/pxc_extra/pxb-8.3"
+XTRABACKUP_PREV_VER_PATH="@LOCALBASE@"
 
 # XB path compatible previous PXC LTS version
-XTRABACKUP_PREV_LTS_VER_PATH="$(dirname $0)/pxc_extra/pxb-8.0"
+XTRABACKUP_PREV_LTS_VER_PATH="@LOCALBASE@"
 
 # Minimum PXB required versions for this node to work
 # To be able to service this version
@@ -221,7 +221,7 @@ JOINER_SST_DIR=""
 
 # Setting the path for ss and ip
 # ss: is utility to investigate socket, ip for network routes.
-export PATH="/usr/sbin:/sbin:$PATH"
+export PATH="@LOCALBASE@/sbin:@LOCALBASE@/bin:/usr/sbin:/usr/bin:/sbin"
 
 #-------------------------------------------------------------------------------
 #
@@ -946,7 +946,14 @@ get_stream()
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
@@ -983,7 +990,7 @@ cleanup_joiner()
     fi
 
     # Final cleanup
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -1022,7 +1029,7 @@ cleanup_donor()
     fi
 
     # Final cleanup
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -1182,7 +1189,7 @@ wait_for_listen()
         wsrep_log_debug "$LINENO: Using ss for socat/nc discovery"
 
         # Revert to using ss to check if socat/nc is listening
-        wsrep_check_program ss
+        : wsrep_check_program ss
         if [[ $? -ne 0 ]]; then
             wsrep_log_error "******** FATAL ERROR *********************** "
             wsrep_log_error "* Could not find 'ss'.  Check that it is installed and in the path."
@@ -1192,7 +1199,7 @@ wait_for_listen()
 
         for i in {1..300}
         do
-            ss -p state listening "( sport = :${port} )" | grep -qE 'socat|nc' && break
+            netstat -an | awk 'BEGIN {rc=1} /\.'${port}' .* LISTEN/ {rc=0} END {exit(rc)}' && break
             sleep 0.2
         done
 
@@ -1644,7 +1651,9 @@ function initialize_pxb_commands()
     xb_version=${xb_version# }
     wsrep_log_debug "pxb-version:$xb_version"
 
-    local decompress_threads=$(grep -c ^processor /proc/cpuinfo)
+    get_proc
+
+    local decompress_threads=${nproc}
     if [[ $decompress_threads -gt 1 ]]; then
         decompress_threads=$((decompress_threads/2))
     fi
