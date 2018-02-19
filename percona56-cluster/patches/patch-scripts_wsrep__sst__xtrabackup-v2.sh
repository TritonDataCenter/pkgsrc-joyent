$NetBSD$

Make SunOS portable. Patch by Derek Crudgington.
--- scripts/wsrep_sst_xtrabackup-v2.sh.orig	2018-01-11 05:21:46.000000000 +0000
+++ scripts/wsrep_sst_xtrabackup-v2.sh
@@ -572,7 +572,13 @@ get_stream()
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
@@ -602,7 +608,7 @@ cleanup_joiner()
     fi
 
     # Final cleanup 
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -641,7 +647,7 @@ cleanup_donor()
     fi
 
     # Final cleanup 
-    pgid=$(ps -o pgid= $$ | grep -o '[0-9]*')
+    pgid=$(ps -o pgid= -p $$ | grep -o '[0-9]*')
 
     # This means no setsid done in mysqld.
     # We don't want to kill mysqld here otherwise.
@@ -681,12 +687,16 @@ wait_for_listen()
 
     for i in {1..300}
     do
+      if [[ $(uname -s | grep SunOS) ]]; then
+        (pfiles $(pgrep 'socat|nc') || true) | grep "AF_INET.* ${PORT}$" >/dev/null && break
+      else
         if [ "`uname`" = "FreeBSD" ] ; then
             get_listening_on_port_cmd="sockstat -l -P tcp -p $PORT"
         else
             get_listening_on_port_cmd="ss -p state listening ( sport = :$PORT )"
         fi
         $get_listening_on_port_cmd | grep -qE 'socat|nc' && break
+      fi
         sleep 0.2
     done
 
