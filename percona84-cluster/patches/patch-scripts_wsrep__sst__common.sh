$NetBSD$

Fix ps(1) portability.

--- scripts/wsrep_sst_common.sh.orig	2020-04-17 13:14:42.000000000 +0000
+++ scripts/wsrep_sst_common.sh
@@ -440,7 +440,7 @@ function wait_for_mysqld_shutdown()
     # Wait until the mysqld instance has shut down
     timeout=$threshold
     while [ true ]; do
-        if ! ps --pid $mysqld_pid >/dev/null; then
+        if ! ps -p $mysqld_pid >/dev/null; then
             # If the process doesn't exist, then it shut down, so we're good
             break
         fi
@@ -475,7 +475,7 @@ function wait_for_mysqld_startup()
     timeout=$threshold
 
     while [ true ]; do
-        if ! ps --pid $mysqld_pid >/dev/null; then
+        if ! ps -p $mysqld_pid >/dev/null; then
             # If the process doesn't exist, then it shut down, so exit
             wsrep_log_error "******************* FATAL ERROR ********************** "
             wsrep_log_error "Failed to start the $description."
