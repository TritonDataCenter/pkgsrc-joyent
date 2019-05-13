$NetBSD$

Make SunOS portable.  XXX: needs to be better really.

--- scripts/wsrep_sst_xtrabackup-v2.sh.orig	2019-02-20 05:46:05.000000000 +0000
+++ scripts/wsrep_sst_xtrabackup-v2.sh
@@ -813,7 +813,13 @@ get_stream()
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
@@ -849,7 +855,7 @@ cleanup_joiner()
     fi
 
     # Final cleanup
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -888,7 +894,7 @@ cleanup_donor()
     fi
 
     # Final cleanup
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -978,6 +984,10 @@ wait_for_listen()
     local port=$3
     local module=$4
 
+    sleep 10
+    echo "ready ${host}:${port}/${module}//$sst_ver"
+    return
+
     # Get the index for the 'local_address' column in /proc/xxxx/net/tcp
     # We expect this to be the same for IPv4 (net/tcp) and IPv6 (net/tcp6)
     local ip_index=0
