$NetBSD$

Make SunOS portable. Patch by Derek Crudgington.
--- scripts/wsrep_sst_xtrabackup-v2.sh.orig	2016-01-24 07:05:46.000000000 +0000
+++ scripts/wsrep_sst_xtrabackup-v2.sh
@@ -367,7 +367,13 @@ get_stream()
 get_proc()
 {
     set +e
-    nproc=$(grep -c processor /proc/cpuinfo)
+
+    if [[ $(uname -s | grep SunOS) ]]; then
+        nproc=$(kstat -p caps::cpucaps_zone*:value | awk '{ printf "%d", ($2+100-1)/100 }')
+    else
+        nproc=$(grep -c processor /proc/cpuinfo)
+    fi
+
     [[ -z $nproc || $nproc -eq 0 ]] && nproc=1
     set -e
 }
@@ -397,7 +403,7 @@ cleanup_joiner()
     fi
 
     # Final cleanup 
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -454,7 +460,7 @@ cleanup_donor()
     fi
 
     # Final cleanup 
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -501,7 +507,11 @@ wait_for_listen()
     local MODULE=$3
     for i in {1..50}
     do
-        ss -p state listening "( sport = :$PORT )" | grep -qE 'socat|nc' && break
+        if [[ $(uname -s | grep SunOS) ]]; then
+            (pfiles $(pgrep 'socat|nc') || true) | grep "AF_INET.* ${PORT}$" >/dev/null && break
+        else
+            ss -p state listening "( sport = :$PORT )" | grep -qE 'socat|nc' && break
+        fi
         sleep 0.2
     done
     echo "ready ${ADDR}/${MODULE}//$sst_ver"
